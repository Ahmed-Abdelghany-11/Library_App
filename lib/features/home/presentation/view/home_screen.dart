import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/di/di.dart';
import 'package:library_app/features/home/presentation/view/widgets/home_body.dart';
import 'package:library_app/features/home/presentation/view/widgets/home_header.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entity/book_entity.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final viewModel = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel..doIntent(GetAllBooks()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final baseState = state.homeState;

                    if (baseState is BaseLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (baseState is BaseErrorState) {
                      return Center(child: Text(baseState.errorMessage));
                    }

                    if (baseState is BaseSuccessState<List<BookEntity>>) {
                      final books = baseState.data;
                      return HomeBody(books: books);
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
