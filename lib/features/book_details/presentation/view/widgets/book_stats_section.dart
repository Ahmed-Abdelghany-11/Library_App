import 'package:flutter/material.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/stat_card.dart';

import '../../../../home/domain/entity/book_entity.dart';

class BookStatsSection extends StatelessWidget {
  final BookEntity book;

  const BookStatsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          StatCard(
            label: 'Average Rating',
            value: book.averageRating?.toStringAsFixed(1) ?? '-',
          ),
          const SizedBox(width: 12),
          StatCard(
            label: 'Reviews',
            value: book.totalRatings?.toString() ?? '-',
          ),
        ],
      ),
    );
  }
}
