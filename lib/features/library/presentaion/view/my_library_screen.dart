import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/library/presentaion/view/widgets/add_reading_list_bottom_sheet.dart';
import 'package:library_app/features/library/presentaion/view/widgets/my_list_item.dart';

import '../../../../core/assets/app_colors.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/utils/di/di.dart';
import '../../domain/entity/reading_list_entity.dart';
import '../view_model/library_cubit.dart';
import '../view_model/library_state.dart';

class MyLibraryScreen extends StatelessWidget {
  MyLibraryScreen({super.key});

  final viewModel = getIt<LibraryCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetReadingList()),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                const SizedBox(height: 8),
                BlocBuilder<LibraryCubit, LibraryState>(
                  builder: (context, state) {
                    final currentState = state.getReadingListState;

                    if (currentState is BaseLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (currentState is BaseErrorState) {
                      return Expanded(
                        child: Center(child: Text(currentState.errorMessage)),
                      );
                    }

                    if (currentState
                        is BaseSuccessState<List<ReadingListEntity>>) {
                      final lists = currentState.data;

                      if (lists == null || lists.isEmpty) {
                        return Expanded(
                          child: const Center(
                            child: Text('No reading lists found.'),
                          ),
                        );
                      }

                      return Expanded(
                        child: ListView.builder(
                          itemCount: lists.length,
                          itemBuilder: (context, index) {
                            final list = lists[index];

                            return Dismissible(
                              key: ValueKey(list.id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                color: Colors.red,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              confirmDismiss: (_) async {
                                viewModel.doIntent(DeleteReadingList(list.id!));
                                return false;
                              },
                              child: MyListItem(
                                title: list.name ?? '',
                                subtitle: '${list.numberOfBooks ?? 0} books',
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) => BlocProvider.value(
                  value: viewModel,
                  child: const AddReadingListBottomSheet(),
                ),
              );
            },
            backgroundColor: AppColors.blue,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
