import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/base/base_state.dart';
import 'main_layout_state.dart';

@injectable
class MainLayoutCubit extends Cubit<MainLayoutState> {
  final scrollVisibilityController = ValueNotifier<bool>(true);
  MainLayoutCubit()
    : super(
        MainLayoutState(
          baseState: BaseInitialState(),
          selectedTab: MainLayoutTabs.home,
        ),
      );

  void _changeTab(MainLayoutTabs tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void _changeTabWithCategory(MainLayoutTabs tab, int index) {
    emit(state.copyWith(selectedTab: tab, categoryIndex: index));
  }

  void doIntent(MainLayoutAction action) {
    switch (action) {
      case ChangeSelectedTab():
        _changeTab(action.selectedTab);
      case ChangeTabWithCategoryIndex():
        _changeTabWithCategory(action.selectedTab, action.categoryIndex);
    }
  }

  void dispose() {
    scrollVisibilityController.dispose();
    super.close();
  }
}
