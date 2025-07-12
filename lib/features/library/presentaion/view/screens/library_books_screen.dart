import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/di/di.dart';
import 'package:library_app/core/utils/routes/route_name.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../home/domain/entity/book_entity.dart';
import '../../../../search/presentation/view/widgets/book_list_item.dart';
import '../../../domain/entity/reading_list_entity.dart';
import '../../view_model/library_books/library_books_cubit.dart';
import '../../view_model/library_books/library_books_state.dart';

class LibraryBooksScreen extends StatelessWidget {
  LibraryBooksScreen({super.key});
  final viewModel = getIt<LibraryBooksCubit>();
  @override
  Widget build(BuildContext context) {
    final readingList =
        ModalRoute.of(context)?.settings.arguments as ReadingListEntity?;

    if (readingList == null || readingList.id == null) {
      return const Scaffold(body: Center(child: Text('Invalid reading list')));
    }

    final readingListId = readingList.id!;

    return BlocProvider(
      create: (_) => viewModel..doIntent(GetBooksInReadingList(readingListId)),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  readingList.name ?? 'Reading List',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: BlocConsumer<LibraryBooksCubit, LibraryBooksState>(
                  listenWhen: (prev, curr) =>
                      prev.deleteBookState != curr.deleteBookState,
                  listener: (context, state) {
                    final deleteState = state.deleteBookState;
                    if (deleteState is BaseErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(deleteState.errorMessage),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final getBooksState = state.getBooksState;

                    if (getBooksState is BaseLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (getBooksState is BaseErrorState) {
                      return Center(
                        child: Text('Error: ${getBooksState.errorMessage}'),
                      );
                    }

                    if (getBooksState is BaseSuccessState<List<BookEntity>>) {
                      final books = getBooksState.data ?? [];

                      if (books.isEmpty) {
                        return const Center(
                          child: Text('No books in this list.'),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: books.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final book = books[index];

                          return Dismissible(
                            key: Key(book.id ?? index.toString()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              color: AppColors.red,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            confirmDismiss: (_) async {
                              context.read<LibraryBooksCubit>().doIntent(
                                DeleteBookFromReadingList(
                                  readingListId,
                                  book.title ?? '',
                                ),
                              );
                              return false;
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.bookDetailsScreen,
                                  arguments: book,
                                );
                              },
                              child: BookListItem(book: book),
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
