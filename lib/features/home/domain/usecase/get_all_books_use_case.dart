import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/book_entity.dart';

@injectable
class GetAllBooksUseCase {
  final HomeRepo _homeRepo;
  GetAllBooksUseCase(this._homeRepo);

  Future<Result<List<BookEntity>>> call() async {
    return await _homeRepo.getAllBooks();
  }
}
