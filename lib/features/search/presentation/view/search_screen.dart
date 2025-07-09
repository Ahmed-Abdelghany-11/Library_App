import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/di/di.dart';
import 'package:library_app/features/search/presentation/view/widgets/search_body.dart';
import 'package:library_app/features/search/presentation/view/widgets/search_form.dart';
import '../../../../core/base/base_state.dart';
import '../../../home/domain/entity/book_entity.dart';
import '../view_model/search_cubit.dart';
import '../view_model/search_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final viewModel = getIt<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchForm(),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.searchState is BaseLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.searchState
                        is BaseSuccessState<List<BookEntity>>) {
                      final books =
                          (state.searchState
                                  as BaseSuccessState<List<BookEntity>>)
                              .data;
                      if (books!.isEmpty) {
                        return const Center(child: Text('No results found'));
                      }
                      return SearchBody(books: books);
                    } else if (state.searchState is BaseErrorState) {
                      return Center(
                        child: Text(
                          (state.searchState as BaseErrorState).errorMessage,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
