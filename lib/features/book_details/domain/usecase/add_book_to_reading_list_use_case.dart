import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/book_details/domain/repo/book_details_repo.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';

@injectable
class AddBookToReadingListUseCase {
  final BookDetailsRepo _bookDetailsRepo;
  AddBookToReadingListUseCase(this._bookDetailsRepo);

  Future<Result<void>> call(String readingListId, BookEntity book) async {
    return await _bookDetailsRepo.addBookToReadingList(readingListId, book);
  }
}
