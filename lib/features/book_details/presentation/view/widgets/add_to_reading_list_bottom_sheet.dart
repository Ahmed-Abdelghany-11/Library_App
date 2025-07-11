import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
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
                    onTap: () async {
                      viewModel.readingListController.text = list.id ?? '';

                      viewModel.doIntent(
                        AddBookToReadingList(list.id ?? '', book),
                      );

                      Navigator.pop(context);

                      final result = viewModel.state.addBookToReadingListState;

                      ScaffoldMessenger.of(
                        Navigator.of(context).context,
                      ).showSnackBar(
                        SnackBar(
                          content: Text(
                            result is BaseSuccessState
                                ? 'Book added to ${list.name}'
                                : 'Error: ${(result as BaseErrorState).errorMessage}',
                          ),
                        ),
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
