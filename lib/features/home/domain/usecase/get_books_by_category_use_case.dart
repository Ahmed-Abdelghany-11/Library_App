import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/book_entity.dart';

@injectable
class GetBooksByCategoryUseCase {
  final HomeRepo _homeRepo;
  GetBooksByCategoryUseCase(this._homeRepo);

  Future<Result<List<BookEntity>>> call(String category) async {
    return await _homeRepo.getBooksByCategory(category);
  }
}
