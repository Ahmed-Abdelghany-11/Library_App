import 'package:flutter/material.dart';

import '../../../domain/entity/book_entity.dart';
import 'book_item.dart';

class BooksSection extends StatelessWidget {
  final List<BookEntity> books;

  const BooksSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: books.length,
        itemBuilder: (_, index) => BookItem(book: books[index]),
      ),
    );
  }
}
