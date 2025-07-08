import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/auth/domain/repo/auth_repo.dart';

@injectable
class SignoutUseCase {
  final AuthRepo _authRepo;
  SignoutUseCase(this._authRepo);

  Future<Result<void>> call() async {
    return await _authRepo.signOut();
  }
}
