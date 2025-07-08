import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/home/presentation/view/home_screen.dart';
import 'package:library_app/features/library/presentaion/my_library_screen.dart';
import 'package:library_app/features/search/presentation/view/search_screen.dart';

import '../../../../core/utils/di/di.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../view_model/main_layout_cubit.dart';
import '../view_model/main_layout_state.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final viewModel = getIt<MainLayoutCubit>();

  final Map<MainLayoutTabs, WidgetBuilder> tabs = {
    MainLayoutTabs.home: (_) => HomeScreen(),
    MainLayoutTabs.search: (_) => SearchScreen(),
    MainLayoutTabs.myLibrary: (_) => MyLibraryScreen(),
    MainLayoutTabs.profile: (_) => ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          final selectedTab = state.selectedTab;

          return Scaffold(
            body: tabs[selectedTab]?.call(context) ?? const SizedBox.shrink(),
            bottomNavigationBar: ValueListenableBuilder<bool>(
              valueListenable: viewModel.scrollVisibilityController,
              builder: (_, visible, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: visible ? kBottomNavigationBarHeight : 0,
                  child: Wrap(
                    children: [
                      Offstage(
                        offstage: !visible,
                        child: BottomNavigationBar(
                          currentIndex: selectedTab.index,
                          onTap: (value) {
                            context.read<MainLayoutCubit>().doIntent(
                              ChangeSelectedTab(MainLayoutTabs.values[value]),
                            );
                          },
                          items: [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: "Home",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.search),
                              label: "Search",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.book),
                              label: "My Library",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person),
                              label: "Profile",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
