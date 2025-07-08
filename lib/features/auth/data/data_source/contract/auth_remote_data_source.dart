import '../../model/signin_request_dto.dart';
import '../../model/signup_request_dto.dart';

abstract class AuthRemoteDataSource {
  Future<bool> getCurrentUserState();
  Future<void> signUp(SignupRequestDto request);
  Future<void> signIn(SigninRequestDto request);
}
