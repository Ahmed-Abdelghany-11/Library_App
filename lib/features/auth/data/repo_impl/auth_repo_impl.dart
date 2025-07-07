import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_manager.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:library_app/features/auth/domain/repo/auth_repo.dart';

import '../../domain/entity/user_request_entity.dart';
import '../model/signup_request_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final ApiManager _apiManager;
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepoImpl(this._authRemoteDataSource, this._apiManager);

  @override
  Future<Result<bool>> getCurrentUserState() async {
    return await _apiManager.execute<bool>(
      () async => await _authRemoteDataSource.getCurrentUserState(),
    );
  }

  @override
  Future<Result<void>> signUp(UserRequestEntity request) async {
    final req = SignupRequestDto.fromEntity(request);
    return await _apiManager.execute<void>(
      () async => await _authRemoteDataSource.signUp(req),
    );
  }
}
