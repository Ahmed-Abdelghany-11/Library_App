import 'package:injectable/injectable.dart';
import 'package:library_app/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../../../book_details/domain/entity/user_entity.dart';

@injectable
class GetCurrentUserDataUseCase {
  final AuthRepo _authRepo;
  GetCurrentUserDataUseCase(this._authRepo);

  Future<Result<UserEntity>> call() async {
    return await _authRepo.getCurrentUserData();
  }
}
