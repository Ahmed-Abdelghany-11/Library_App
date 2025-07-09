import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/search/presentation/view_model/search_cubit.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../view_model/search_state.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: viewModel.searchController,
        onChanged: (_) => viewModel.doIntent(OnSearchChanged()),
        decoration: InputDecoration(
          hintText: 'Search for books or authors',
          prefixIcon: Icon(Icons.search, color: AppColors.black),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
