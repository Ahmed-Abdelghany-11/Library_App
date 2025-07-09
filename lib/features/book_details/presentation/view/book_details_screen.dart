import 'package:flutter/material.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_cover_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_description_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_info_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_reviews_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_stats_section.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BookCoverSection(book: book)),
          SliverToBoxAdapter(
            child: BookInfoSection(book: book, categories: categories),
          ),
          SliverToBoxAdapter(child: BookStatsSection(book: book)),
          SliverToBoxAdapter(child: BookDescriptionSection(book: book)),
          const SliverToBoxAdapter(child: BookReviewsSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
