import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

class LibraryState extends Equatable {
  final BaseState? getReadingListState;
  final BaseState? addReadingListState;
  final BaseState? deleteReadingListState;
  final BaseState? getReadingListByNameState;

  const LibraryState({
    this.getReadingListState,
    this.addReadingListState,
    this.deleteReadingListState,
    this.getReadingListByNameState,
  });

  LibraryState copyWith({
    BaseState? getReadingListState,
    BaseState? addReadingListState,
    BaseState? deleteReadingListState,
    BaseState? getReadingListByNameState,
  }) {
    return LibraryState(
      getReadingListState: getReadingListState ?? this.getReadingListState,
      addReadingListState: addReadingListState ?? this.addReadingListState,
      deleteReadingListState:
          deleteReadingListState ?? this.deleteReadingListState,
      getReadingListByNameState:
          getReadingListByNameState ?? this.getReadingListByNameState,
    );
  }

  @override
  List<Object?> get props => [
    getReadingListState,
    addReadingListState,
    deleteReadingListState,
    getReadingListByNameState,
  ];
}

sealed class LibraryAction {}

class GetReadingList extends LibraryAction {}

class AddReadingList extends LibraryAction {}

class DeleteReadingList extends LibraryAction {
  final String readingListId;

  DeleteReadingList(this.readingListId);
}
