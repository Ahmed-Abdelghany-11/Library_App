import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/features/auth/domain/usecase/get_current_user_data_use_case.dart';
import 'package:library_app/features/profile/presentation/view_model/profile_state.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../../../auth/domain/usecase/signout_use_case.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetCurrentUserDataUseCase _getCurrentUserDataUseCase;
  final SignoutUseCase _signoutUseCase;
  ProfileCubit(this._getCurrentUserDataUseCase, this._signoutUseCase)
    : super(ProfileState(profileState: BaseInitialState()));

  Future<void> _getCurrentUserData() async {
    emit(state.copyWith(profileState: BaseLoadingState()));
    final result = await _getCurrentUserDataUseCase();
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(profileState: BaseSuccessState(data: result.data)));
      case FailureResult():
        emit(
          state.copyWith(
            profileState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _logout() async {
    emit(state.copyWith(profileState: BaseLoadingState()));
    final result = await _signoutUseCase();
    switch (result) {
      case SuccessResult():
        emit(state.copyWith(profileState: BaseSuccessState()));
      case FailureResult():
        emit(
          state.copyWith(
            profileState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void doIntent(ProfileAction action) {
    switch (action) {
      case GetProfile():
        _getCurrentUserData();
      case Logout():
        _logout();
    }
  }
}
