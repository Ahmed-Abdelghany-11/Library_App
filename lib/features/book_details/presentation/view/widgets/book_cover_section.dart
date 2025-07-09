import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../home/domain/entity/book_entity.dart';

class BookCoverSection extends StatelessWidget {
  final BookEntity book;

  const BookCoverSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: book.coverUrl != null
              ? Image.network(book.coverUrl!, fit: BoxFit.fill)
              : Container(color: AppColors.lightGray.withValues(alpha: 0.1)),
        ),
      ),
    );
  }
}
