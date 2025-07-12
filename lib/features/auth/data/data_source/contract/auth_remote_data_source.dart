import 'package:library_app/features/book_details/data/model/user_dto.dart';

import '../../model/signin_request_dto.dart';
import '../../model/signup_request_dto.dart';

abstract class AuthRemoteDataSource {
  Future<bool> getCurrentUserState();
  Future<void> signUp(SignupRequestDto request);
  Future<void> signIn(SigninRequestDto request);
  Future<void> signOut();
  Future<UserDto> getCurrentUserData(String userId);
}
