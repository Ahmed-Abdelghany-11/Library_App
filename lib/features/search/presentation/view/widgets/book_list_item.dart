import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../home/domain/entity/book_entity.dart';

class BookListItem extends StatelessWidget {
  final BookEntity book;

  const BookListItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: book.coverUrl != null
                ? DecorationImage(
                    image: NetworkImage(book.coverUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
            color: AppColors.lightGray.withValues(alpha: 0.3),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title ?? '',
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                book.author ?? '',
                style: const TextStyle(
                  color: AppColors.lightGray,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
