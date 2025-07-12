import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/base/base_state.dart';
import '../../view_model/library/library_cubit.dart';
import '../../view_model/library/library_state.dart';

class AddReadingListBottomSheet extends StatelessWidget {
  const AddReadingListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LibraryCubit>();

    return Padding(
      padding: EdgeInsets.all(20),
      child: BlocConsumer<LibraryCubit, LibraryState>(
        listenWhen: (previous, current) =>
            previous.addReadingListState != current.addReadingListState,
        listener: (context, state) {
          final addState = state.addReadingListState;

          if (addState is BaseSuccessState) {
            Navigator.pop(context);
            viewModel.readingListNameController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Reading list created.'),
                backgroundColor: AppColors.green,
              ),
            );
          } else if (addState is BaseErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(addState.errorMessage),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final addState = state.addReadingListState;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create New Reading List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: viewModel.readingListNameController,
                decoration: const InputDecoration(
                  labelText: 'List Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.doIntent(AddReadingList());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                  ),
                  child: addState is BaseLoadingState
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Create',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
