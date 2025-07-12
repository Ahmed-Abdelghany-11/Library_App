import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/di/di.dart';
import 'package:library_app/features/home/presentation/view/widgets/home_body.dart';
import 'package:library_app/features/home/presentation/view/widgets/home_header.dart';
import '../../../../core/base/base_state.dart';
import '../../../library/domain/entity/reading_list_entity.dart';
import '../../domain/entity/book_entity.dart';
import '../view_model/home/home_cubit.dart';
import '../view_model/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final viewModel = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        viewModel.doIntent(GetSomeBooks());
        viewModel.doIntent(GetReadingList());
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final booksState = state.homeState;
                    final readingListsState = state.getReadingListState;

                    if (booksState is BaseLoadingState ||
                        readingListsState is BaseLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (booksState is BaseErrorState) {
                      return Center(child: Text(booksState.errorMessage));
                    }

                    if (readingListsState is BaseErrorState) {
                      return Center(
                        child: Text(readingListsState.errorMessage),
                      );
                    }

                    if (booksState is BaseSuccessState<List<BookEntity>> &&
                        readingListsState
                            is BaseSuccessState<List<ReadingListEntity>>) {
                      return HomeBody(
                        books: booksState.data,
                        readingLists: readingListsState.data,
                      );
                    }

                    return const SizedBox.shrink();
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
