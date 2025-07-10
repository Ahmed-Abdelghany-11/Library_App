import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/add_review_bottom_sheet.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_cover_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_description_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_info_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_reviews_section.dart';
import 'package:library_app/features/book_details/presentation/view/widgets/book_stats_section.dart';
import '../../../../core/assets/app_colors.dart';
import '../../../../core/utils/di/di.dart';
import '../../../home/domain/entity/book_entity.dart';
import '../view_model/book_details_cubit.dart';
import '../view_model/book_details_state.dart';

class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({super.key});

  final viewModel = getIt<BookDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as BookEntity;
    final categories = book.category?.join(' • ') ?? '';

    return BlocProvider(
      create: (_) => viewModel
        ..doIntent(GetUserData())
        ..doIntent(GetBookReviews(book.id!)),
      child: Scaffold(
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: BookCoverSection(book: book)),
              SliverToBoxAdapter(
                child: BookInfoSection(book: book, categories: categories),
              ),
              SliverToBoxAdapter(child: BookStatsSection(book: book)),
              SliverToBoxAdapter(child: BookDescriptionSection(book: book)),
              SliverToBoxAdapter(child: BookReviewsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => AddReviewBottomSheet(
                            bookId: book.id!,
                            viewModel: viewModel,
                          ),
                        );
                      },
                      child: const Text('Add Review'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
