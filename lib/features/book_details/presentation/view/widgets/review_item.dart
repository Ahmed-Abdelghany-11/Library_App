import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

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
                  'https://i.pravatar.cc/100?img=5',
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
