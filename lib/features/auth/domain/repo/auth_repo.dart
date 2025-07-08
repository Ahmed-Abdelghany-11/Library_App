import 'package:library_app/core/utils/networking/api_result.dart';

import '../entity/user_request_entity.dart';

abstract class AuthRepo {
  Future<Result<bool>> getCurrentUserState();
  Future<Result<void>> signUp(UserRequestEntity request);
}
