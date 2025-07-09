import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/book_entity.dart';

@injectable
class GetBookByIdUseCase {
  final HomeRepo _homeRepo;
  GetBookByIdUseCase(this._homeRepo);

  Future<Result<BookEntity>> call(String id) async {
    return await _homeRepo.getBookById(id);
  }
}
