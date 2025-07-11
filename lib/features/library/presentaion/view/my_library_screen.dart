import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/di/di.dart';
import '../../domain/entity/reading_list_entity.dart';
import '../view_model/library_cubit.dart';
import '../view_model/library_state.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  _MyLibraryScreenState createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  late LibraryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<LibraryCubit>();
    _cubit.doIntent(GetReadingList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('My Lists'), centerTitle: false),
        body: BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            final getState = state.getReadingListState;
            if (getState is BaseLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (getState is BaseSuccessState<List<ReadingListEntity>>) {
              final lists = getState.data;
              return ListView.separated(
                itemCount: lists!.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final list = lists[index];
                  return ListTile(
                    title: Text(list.name!),
                    subtitle: Text('${list.numberOfBooks} books'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        _cubit.doIntent(DeleteReadingList(list.id!));
                      },
                    ),
                    onTap: () {
                      // navigate to list details
                    },
                  );
                },
              );
            } else if (getState is BaseErrorState) {
              return Center(child: Text(getState.errorMessage));
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddBottomSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        // re-provide the same cubit instance to the sheet
        return BlocProvider.value(
          value: _cubit,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _cubit.readingListNameController,
                  decoration: const InputDecoration(
                    labelText: 'List Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                BlocConsumer<LibraryCubit, LibraryState>(
                  listener: (context, state) {
                    if (state.addReadingListState is BaseSuccessState) {
                      Navigator.of(context).pop();
                      _cubit.doIntent(GetReadingList());
                    } else if (state.addReadingListState is BaseErrorState) {
                      final err = state.addReadingListState as BaseErrorState;
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(err.errorMessage)));
                    }
                  },
                  builder: (context, state) {
                    if (state.addReadingListState is BaseLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        _cubit.doIntent(AddReadingList());
                      },
                      child: const Text('Add List'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _cubit.readingListNameController.dispose();
    super.dispose();
  }
}
