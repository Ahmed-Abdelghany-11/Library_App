import 'package:equatable/equatable.dart';

import '../../../../../core/base/base_state.dart';

enum MainLayoutTabs { home, search, myLibrary, profile }

class MainLayoutState extends Equatable {
  final BaseState baseState;
  final MainLayoutTabs selectedTab;
  final int? categoryIndex;

  const MainLayoutState({
    required this.baseState,
    required this.selectedTab,
    this.categoryIndex,
  });

  @override
  List<Object?> get props => [baseState, selectedTab, categoryIndex];

  MainLayoutState copyWith({
    BaseState? baseState,
    MainLayoutTabs? selectedTab,
    int? categoryIndex,
  }) {
    return MainLayoutState(
      baseState: baseState ?? this.baseState,
      selectedTab: selectedTab ?? this.selectedTab,
      categoryIndex: categoryIndex ?? this.categoryIndex,
    );
  }
}

sealed class MainLayoutAction {}

class ChangeSelectedTab extends MainLayoutAction {
  final MainLayoutTabs selectedTab;

  ChangeSelectedTab(this.selectedTab);
}

class ChangeTabWithCategoryIndex extends MainLayoutAction {
  final MainLayoutTabs selectedTab;
  final int categoryIndex;

  ChangeTabWithCategoryIndex(this.selectedTab, this.categoryIndex);
}
