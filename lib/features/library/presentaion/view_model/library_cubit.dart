import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/library/domain/entity/reading_list_entity.dart';
import 'package:library_app/features/library/domain/usecase/get_reading_list_by_name_use_case.dart';

import '../../domain/usecase/add_reading_list_use_case.dart';
import '../../domain/usecase/delete_reading_list_use_case.dart';
import '../../domain/usecase/get_reading_lists_use_case.dart';
import 'library_state.dart';

@injectable
class LibraryCubit extends Cubit<LibraryState> {
  final GetReadingListsUseCase _getReadingListsUseCase;
  final AddReadingListUseCase _addReadingListUseCase;
  final DeleteReadingListUseCase _deleteReadingListUseCase;
  final GetReadingListByNameUseCase _getReadingListByNameUseCase;

  LibraryCubit(
    this._getReadingListsUseCase,
    this._addReadingListUseCase,
    this._deleteReadingListUseCase,
    this._getReadingListByNameUseCase,
  ) : super(
        LibraryState(
          getReadingListState: BaseInitialState(),
          addReadingListState: BaseInitialState(),
          deleteReadingListState: BaseInitialState(),
          getReadingListByNameState: BaseInitialState(),
        ),
      );

  final TextEditingController readingListNameController =
      TextEditingController();

  void doIntent(LibraryAction action) {
    switch (action) {
      case GetReadingList():
        _getReadingLists();
      case AddReadingList():
        _addReadingList();
      case DeleteReadingList():
        _deleteReadingList(action.readingListId);
    }
  }

  Future<void> _getReadingLists() async {
    emit(state.copyWith(getReadingListState: BaseLoadingState()));
    final result = await _getReadingListsUseCase();
    switch (result) {
      case SuccessResult<List<ReadingListEntity>>():
        emit(
          state.copyWith(
            getReadingListState: BaseSuccessState(data: result.data),
          ),
        );
      case FailureResult<List<ReadingListEntity>>():
        emit(
          state.copyWith(
            getReadingListState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _addReadingList() async {
    emit(state.copyWith(addReadingListState: BaseLoadingState()));
    if (readingListNameController.text.isEmpty) {
      emit(
        state.copyWith(
          addReadingListState: BaseErrorState(
            errorMessage: "Reading list name cannot be empty",
          ),
        ),
      );
      return;
    }
    await _getReadingListByName(readingListNameController.text);
    if (state.getReadingListByNameState is BaseSuccessState &&
        (state.getReadingListByNameState as BaseSuccessState<ReadingListEntity>)
                .data !=
            null) {
      emit(
        state.copyWith(
          addReadingListState: BaseErrorState(
            errorMessage: "Reading list with this name already exists",
          ),
        ),
      );
      return;
    }
    final result = await _addReadingListUseCase(
      ReadingListEntity(
        name: readingListNameController.text,
        numberOfBooks: 0,
        id: _generateRandomId(),
      ),
    );
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(addReadingListState: BaseSuccessState()));
        await _getReadingLists();
      case FailureResult<void>():
        emit(
          state.copyWith(
            addReadingListState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _deleteReadingList(String readingListId) async {
    emit(state.copyWith(deleteReadingListState: BaseLoadingState()));
    final result = await _deleteReadingListUseCase(readingListId);
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(deleteReadingListState: BaseSuccessState()));
        await _getReadingLists();
      case FailureResult<void>():
        emit(
          state.copyWith(
            deleteReadingListState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _getReadingListByName(String name) async {
    emit(state.copyWith(getReadingListByNameState: BaseLoadingState()));
    final result = await _getReadingListByNameUseCase(name);
    switch (result) {
      case SuccessResult<ReadingListEntity>():
        emit(
          state.copyWith(
            getReadingListByNameState: BaseSuccessState(data: result.data),
          ),
        );
      case FailureResult<ReadingListEntity>():
        emit(
          state.copyWith(
            getReadingListByNameState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  String _generateRandomId([int length = 20]) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random.secure();
    return List.generate(
      length,
      (index) => chars[rand.nextInt(chars.length)],
    ).join();
  }
}
