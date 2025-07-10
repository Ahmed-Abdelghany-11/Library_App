import 'package:flutter/material.dart';

import '../../../domain/entity/review_entity.dart';

class ReviewItem extends StatelessWidget {
  final ReviewEntity review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
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
                  'https://cdn.vectorstock.com/i/1000x1000/89/97/man-male-avatar-silhouette-person-icon-vector-10248997.webp',
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.username ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              review.rating?.toInt() ?? 0,
              (_) => const Icon(Icons.star, size: 16, color: Colors.amber),
            ),
          ),
          const SizedBox(height: 8),
          Text(review.reviewText ?? '', style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
