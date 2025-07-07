import '../../model/signup_request_dto.dart';

abstract class AuthRemoteDataSource {
  Future<bool> getCurrentUserState();
  Future<void> signUp(SignupRequestDto request);
}
