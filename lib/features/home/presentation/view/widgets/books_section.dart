import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/routes/route_name.dart';
import 'package:library_app/features/home/presentation/view_model/home_cubit.dart';

import '../../../domain/entity/book_entity.dart';
import '../../view_model/home_state.dart';
import 'book_item.dart';

class BooksSection extends StatelessWidget {
  final List<BookEntity> books;

  const BooksSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeCubit>();
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: books.length,
        itemBuilder: (_, index) => GestureDetector(
          child: BookItem(book: books[index]),
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteName.bookDetailsScreen,
              arguments: books[index],
            ).then((_) => viewModel.doIntent(GetAllBooks()));
          },
        ),
      ),
    );
  }
}
