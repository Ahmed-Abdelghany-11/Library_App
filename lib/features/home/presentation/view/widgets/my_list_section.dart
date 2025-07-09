import 'package:flutter/material.dart';

import 'my_list_item.dart';

class MyListSection extends StatelessWidget {
  final int bookCount;

  const MyListSection({super.key, required this.bookCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyListTile(
          icon: Icons.book_outlined,
          title: 'Currently Reading',
          subtitle: '$bookCount books',
        ),
        MyListTile(
          icon: Icons.bookmark_outline,
          title: 'Want to Read',
          subtitle: '$bookCount books',
        ),
        MyListTile(
          icon: Icons.check_circle_outline,
          title: 'Finished Reading',
          subtitle: '$bookCount books',
        ),
      ],
    );
  }
}
