import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../library/domain/entity/reading_list_entity.dart';
import '../../../domain/entity/book_entity.dart';
import 'books_section.dart';
import 'my_list_section.dart';

class HomeBody extends StatelessWidget {
  final List<BookEntity>? books;
  final List<ReadingListEntity>? readingLists;

  const HomeBody({super.key, this.books, this.readingLists});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'For You',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ),
          BooksSection(books: books ?? []),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'My Lists',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ),
          MyListSection(readingLists: readingLists ?? []),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
