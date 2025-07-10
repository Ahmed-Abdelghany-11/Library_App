import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../domain/entity/user_entity.dart';
import '../../view_model/book_details_cubit.dart';
import '../../view_model/book_details_state.dart';

class AddReviewBottomSheet extends StatelessWidget {
  final String bookId;
  final BookDetailsCubit viewModel;

  const AddReviewBottomSheet({
    super.key,
    required this.bookId,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Leave a Review',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (i) {
              return IconButton(
                icon: Icon(
                  i < viewModel.selectedRating ? Icons.star : Icons.star_border,
                  color: AppColors.yellow,
                ),
                onPressed: () {
                  viewModel.updateSelectedRating(i + 1);
                },
              );
            }),
          ),
          TextField(
            controller: viewModel.reviewTextController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Your review',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final user =
                    (viewModel.state.getUserDataState
                        is BaseSuccessState<UserEntity>)
                    ? (viewModel.state.getUserDataState
                              as BaseSuccessState<UserEntity>)
                          .data
                    : null;

                if (user != null && viewModel.selectedRating > 0) {
                  viewModel.doIntent(
                    AddBookReview(
                      bookId,
                      user.id!,
                      '${user.firstName} ${user.lastName}',
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
