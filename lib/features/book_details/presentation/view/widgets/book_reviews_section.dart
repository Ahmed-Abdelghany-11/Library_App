import 'package:flutter/material.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/review_item.dart';

import '../../../../../core/assets/app_colors.dart';

class BookReviewsSection extends StatelessWidget {
  const BookReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Align(
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
        SizedBox(
          height: 320,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (_, index) => const ReviewItem(),
          ),
        ),
      ],
    );
  }
}
