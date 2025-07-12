import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../home/domain/entity/book_entity.dart';
import '../../view_model/book_details_cubit.dart';
import '../../view_model/book_details_state.dart';

class AddToReadingListBottomSheet extends StatelessWidget {
  final BookEntity book;

  const AddToReadingListBottomSheet({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<BookDetailsCubit>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocConsumer<BookDetailsCubit, BookDetailsState>(
        listenWhen: (previous, current) =>
            previous.addBookToReadingListState !=
            current.addBookToReadingListState,
        listener: (context, state) {
          final addState = state.addBookToReadingListState;

          if (addState is BaseSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Book added to reading list'),
                backgroundColor: AppColors.green,
              ),
            );
          } else if (addState is BaseErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${addState.errorMessage}'),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final readingListState = state.getUserReadingListsState;

          if (readingListState is BaseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (readingListState is BaseErrorState) {
            return Center(
              child: Text("Error: ${readingListState.errorMessage}"),
            );
          }

          if (readingListState is BaseSuccessState) {
            final lists = readingListState.data;

            if (lists.isEmpty) {
              return const SizedBox(
                height: 150,
                child: Center(
                  child: Text(
                    "No reading lists found.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add to Reading List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...lists.map<Widget>((list) {
                  return ListTile(
                    title: Text(list.name ?? ''),
                    onTap: () {
                      viewModel.readingListController.text = list.id ?? '';
                      viewModel.doIntent(
                        AddBookToReadingList(list.id ?? '', book),
                      );
                    },
                  );
                }).toList(),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
