import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/di/di.dart';

import '../../../../core/base/base_state.dart';
import '../../../../core/utils/routes/route_name.dart';
import '../../../book_details/domain/entity/user_entity.dart';
import '../view_model/profile_cubit.dart';
import '../view_model/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final viewModel = getIt<ProfileCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetProfile()),
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final baseState = state.profileState;

            if (baseState is BaseLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (baseState is BaseSuccessState<UserEntity>) {
              final user = baseState.data;

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://cdn.vectorstock.com/i/1000x1000/89/97/man-male-avatar-silhouette-person-icon-vector-10248997.webp',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${user!.firstName ?? ''} ${user.lastName ?? ''}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.email ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProfileCubit>().doIntent(Logout());
                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.loginScreen,
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            } else if (baseState is BaseErrorState) {
              return Center(child: Text(baseState.errorMessage));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
