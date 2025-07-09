import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../home/domain/entity/book_entity.dart';

class BookInfoSection extends StatelessWidget {
  final BookEntity book;
  final String categories;

  const BookInfoSection({
    super.key,
    required this.book,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final pageInfo =
        '${categories}${categories.isNotEmpty && book.pageCount != null ? ' • ' : ''}${book.pageCount ?? ''} pages';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(
            book.title ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            book.author ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.lightGray, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(
            pageInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.lightGray, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
