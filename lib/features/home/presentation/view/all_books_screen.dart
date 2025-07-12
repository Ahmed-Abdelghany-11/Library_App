import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/di/di.dart';
import 'package:library_app/features/home/presentation/view/widgets/filter_books_bottom_sheet.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/routes/route_name.dart';
import '../../../search/presentation/view/widgets/book_list_item.dart';
import '../../domain/entity/book_entity.dart';
import '../view_model/all_books/all_books_cubit.dart';
import '../view_model/all_books/all_books_state.dart';

class AllBooksScreen extends StatelessWidget {
  AllBooksScreen({super.key});

  final viewModel = getIt<AllBooksCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetAllBooks()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Books'),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (_) => BlocProvider.value(
                    value: viewModel,
                    child: const FilterBooksBottomSheet(),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<AllBooksCubit, AllBooksState>(
          builder: (context, state) {
            BaseState? currentState;

            switch (state.currentFilter) {
              case BookFilterType.category:
                currentState = state.getBooksByCategoryState;
              case BookFilterType.rating:
                currentState = state.getBooksByRatingState;
              case BookFilterType.all:
                currentState = state.getAllBooksState;
            }

            if (currentState is BaseLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (currentState is BaseSuccessState<List<BookEntity>>) {
              final books = currentState.data ?? [];
              return ListView.separated(
                itemCount: books.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: BookListItem(book: books[index]),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.bookDetailsScreen,
                          arguments: books[index],
                        );
                      },
                    ),
                  );
                },
              );
            } else if (currentState is BaseErrorState) {
              return Center(child: Text(currentState.errorMessage));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
