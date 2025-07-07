import 'package:injectable/injectable.dart';
import 'package:library_app/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/user_request_entity.dart';

@injectable
class SignupUseCase {
  final AuthRepo _authRepo;
  SignupUseCase(this._authRepo);

  Future<Result<void>> call(UserRequestEntity request) async {
    return await _authRepo.signUp(request);
  }
}
