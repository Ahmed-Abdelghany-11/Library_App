import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/review_item.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../../domain/entity/review_entity.dart';
import '../../view_model/book_details_cubit.dart';
import '../../view_model/book_details_state.dart';

class BookReviewsSection extends StatelessWidget {
  const BookReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Reviews',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        BlocBuilder<BookDetailsCubit, BookDetailsState>(
          builder: (context, state) {
            if (state.getReviewState is BaseLoadingState) {
              return SizedBox(
                height: 320,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (state.getReviewState
                is BaseSuccessState<List<ReviewEntity>>) {
              final reviews =
                  (state.getReviewState as BaseSuccessState<List<ReviewEntity>>)
                      .data;
              if (reviews == null || reviews.isEmpty) {
                return SizedBox(
                  height: 320,
                  child: Center(
                    child: Text(
                      'No reviews available',
                      style: TextStyle(color: AppColors.gray, fontSize: 16),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: 320,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: reviews!.length,
                    itemBuilder: (_, index) =>
                        ReviewItem(review: reviews[index]),
                  ),
                );
              }
            } else if (state.getReviewState is BaseErrorState) {
              return SizedBox(
                height: 320,
                child: Center(
                  child: Text(
                    (state.getReviewState as BaseErrorState).errorMessage,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
