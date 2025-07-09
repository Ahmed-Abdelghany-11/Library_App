import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../home/domain/entity/book_entity.dart';

class BookDescriptionSection extends StatelessWidget {
  final BookEntity book;

  const BookDescriptionSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About the Book',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            book.description ?? '',
            style: const TextStyle(color: AppColors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
