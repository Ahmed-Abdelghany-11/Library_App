import 'package:flutter/material.dart';
import 'package:library_app/core/utils/routes/route_name.dart';

import '../../../../home/domain/entity/book_entity.dart';
import 'book_list_item.dart';

class SearchBody extends StatelessWidget {
  final List<BookEntity> books;
  const SearchBody({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: books.length,
      separatorBuilder: (context, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          child: BookListItem(book: book),
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteName.bookDetailsScreen,
              arguments: book,
            );
          },
        );
      },
    );
  }
}
