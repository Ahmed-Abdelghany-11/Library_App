import 'package:library_app/core/utils/networking/api_result.dart';

import '../entity/signin_request_entity.dart';
import '../entity/signup_request_entity.dart';

abstract class AuthRepo {
  Future<Result<bool>> getCurrentUserState();
  Future<Result<void>> signUp(SignupRequestEntity request);
  Future<Result<void>> signIn(SigninRequestEntity request);
}
