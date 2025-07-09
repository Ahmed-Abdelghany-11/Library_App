import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../domain/entity/book_entity.dart';

class BookItem extends StatelessWidget {
  final BookEntity book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(book.coverUrl ?? '', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            book.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          Text(
            book.author ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: AppColors.lightGray),
          ),
        ],
      ),
    );
  }
}
