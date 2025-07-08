import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/auth/domain/repo/auth_repo.dart';

import '../entity/signin_request_entity.dart';

@injectable
class SigninUseCase {
  final AuthRepo _authRepo;
  SigninUseCase(this._authRepo);

  Future<Result<void>> call(SigninRequestEntity request) async {
    return await _authRepo.signIn(request);
  }
}
