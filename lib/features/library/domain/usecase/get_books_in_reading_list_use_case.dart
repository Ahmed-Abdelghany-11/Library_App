import 'package:injectable/injectable.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../../../home/domain/entity/book_entity.dart';

@injectable
class GetBooksInReadingListUseCase {
  final LibraryRepo _libraryRepo;

  GetBooksInReadingListUseCase(this._libraryRepo);

  Future<Result<List<BookEntity>>> call(String readingListId) async {
    return _libraryRepo.getBooksInReadingList(readingListId);
  }
}
