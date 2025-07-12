import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../view_model/all_books/all_books_cubit.dart';
import '../../view_model/all_books/all_books_state.dart';

class FilterBooksBottomSheet extends StatelessWidget {
  const FilterBooksBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AllBooksCubit>();
    final selectedCategory = viewModel.categoryController.text;
    final selectedRating = viewModel.ratingController.text;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Books',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Category chips
          const Text('By Category'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                [
                  'Historical',
                  'Fiction',
                  'Childrens',
                  'Classics',
                  'Romance',
                  'Fantasy',
                ].map((category) {
                  final isSelected = selectedCategory == category;
                  return ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) {
                      viewModel.categoryController.text = category;
                      Navigator.pop(context);
                      viewModel.doIntent(GetBooksByCategory());
                    },
                    selectedColor: AppColors.blue,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 16),
          const Text('By Rating'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (i) {
              final starValue = (i + 1).toDouble();
              final selectedValue = double.tryParse(selectedRating) ?? 0;
              final isSelected = starValue <= selectedValue;

              return IconButton(
                icon: Icon(
                  Icons.star,
                  color: isSelected ? AppColors.yellow : AppColors.lightGray,
                ),
                onPressed: () {
                  viewModel.ratingController.text = starValue.toString();
                  Navigator.pop(context);
                  viewModel.doIntent(GetBooksByRating());
                },
              );
            }),
          ),

          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                viewModel.categoryController.clear();
                viewModel.ratingController.clear();
                Navigator.pop(context);
                viewModel.doIntent(GetAllBooks());
              },
              child: const Text(
                'Clear Filters',
                style: TextStyle(color: AppColors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
