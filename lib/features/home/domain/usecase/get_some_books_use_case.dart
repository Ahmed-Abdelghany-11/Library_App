import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/book_entity.dart';

@injectable
class GetSomeBooksUseCase {
  final HomeRepo _homeRepo;
  GetSomeBooksUseCase(this._homeRepo);

  Future<Result<List<BookEntity>>> call() async {
    return await _homeRepo.getSomeBooks();
  }
}
