import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_manager.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:library_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:library_app/features/auth/domain/entity/signin_request_entity.dart';
import 'package:library_app/features/auth/domain/repo/auth_repo.dart';

import '../../domain/entity/signup_request_entity.dart';
import '../model/signin_request_dto.dart';
import '../model/signup_request_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final ApiManager _apiManager;
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepoImpl(
    this._authRemoteDataSource,
    this._apiManager,
    this._authLocalDataSource,
  );

  @override
  Future<Result<bool>> getCurrentUserState() async {
    return await _apiManager.execute<bool>(
      () async => await _authRemoteDataSource.getCurrentUserState(),
    );
  }

  @override
  Future<Result<void>> signUp(SignupRequestEntity request) async {
    final req = SignupRequestDto.fromEntity(request);
    return await _apiManager.execute<void>(
      () async => await _authRemoteDataSource.signUp(req),
    );
  }

  @override
  Future<Result<void>> signIn(SigninRequestEntity request) async {
    final req = SigninRequestDto.fromEntity(request);
    return await _apiManager.execute<void>(() async {
      await _authRemoteDataSource.signIn(req);

      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        await _authLocalDataSource.saveUserId(uid);
      }
    });
  }

  @override
  Future<Result<void>> signOut() async {
    return await _apiManager.execute<void>(() async {
      await _authRemoteDataSource.signOut();
      await _authLocalDataSource.clearUserId();
    });
  }
}
