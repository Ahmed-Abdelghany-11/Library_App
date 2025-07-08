import 'package:injectable/injectable.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../repo/auth_repo.dart';

@injectable
class GetUserStateUseCase {
  final AuthRepo _authRepo;
  GetUserStateUseCase(this._authRepo);

  Future<Result<bool>> call() async {
    return await _authRepo.getCurrentUserState();
  }
}
