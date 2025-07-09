import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors.dart';
import '../../../home/domain/entity/book_entity.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as BookEntity;
    final categories = book.category?.join(' • ') ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Book Details',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: book.coverUrl != null
                          ? Image.network(book.coverUrl!, fit: BoxFit.fill)
                          : Container(
                              color: AppColors.lightGray.withValues(alpha: 0.1),
                            ),
                    ),
                  ),
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
                    style: const TextStyle(
                      color: AppColors.lightGray,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$categories${categories.isNotEmpty && book.pageCount != null ? ' • ' : ''}${book.pageCount ?? ''} pages',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.lightGray,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Stats cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _StatCard(
                    label: 'Average Rating',
                    value: book.averageRating?.toStringAsFixed(1) ?? '-',
                  ),
                  const SizedBox(width: 12),
                  _StatCard(
                    label: 'Reviews',
                    value: book.totalRatings?.toString() ?? '-',
                  ),
                ],
              ),
            ),

            // About section
            Padding(
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
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: List.generate(2, (index) => _ReviewTile()).toList(),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDCE0E5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF111418),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF637488), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder static review
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuD-Uhv4KINwgCIcLbvRZ1OP7I_YZPyLgy5GcO98JuboRoBOh9YPer2-oK4efFYZEecJHhCvBZKcmQdfkc2vOy2gLgOaccZiCA5J17D2Na8XDljYgUO8fD0yKzQE-v_GtA_wanr58GQ74FdYoi72it2q_edgZl7HRsN83WWMCjSiW7iG2TI5XiLkUOXxwk0-EmMPe2TX3yEMf366I__JbheQPY3nO_EqHj800ClqTT-bshU1tyv7Ypp85D-dFuyz2SD5JKklYTeawSkr',
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Reviewer Name',
                    style: TextStyle(
                      color: Color(0xFF111418),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '2 months ago',
                    style: TextStyle(color: Color(0xFF637488), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (i) {
              return const Icon(Icons.star, size: 16, color: Color(0xFF111418));
            }),
          ),
          const SizedBox(height: 8),
          const Text(
            'This is a sample review text. Absolutely captivating! The world-building is phenomenal...',
            style: TextStyle(color: Color(0xFF111418), fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.thumb_up,
                  size: 18,
                  color: Color(0xFF637488),
                ),
                onPressed: () {},
              ),
              const Text('15', style: TextStyle(color: Color(0xFF637488))),
              const SizedBox(width: 24),
              IconButton(
                icon: const Icon(
                  Icons.thumb_down,
                  size: 18,
                  color: Color(0xFF637488),
                ),
                onPressed: () {},
              ),
              const Text('2', style: TextStyle(color: Color(0xFF637488))),
            ],
          ),
        ],
      ),
    );
  }
}
