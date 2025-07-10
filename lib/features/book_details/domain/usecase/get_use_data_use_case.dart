import 'package:injectable/injectable.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/user_entity.dart';
import '../repo/book_details_repo.dart';

@injectable
class GetUseDataUseCase {
  final BookDetailsRepo _bookDetailsRepo;
  GetUseDataUseCase(this._bookDetailsRepo);

  Future<Result<UserEntity>> call() async {
    return await _bookDetailsRepo.getUserData();
  }
}
