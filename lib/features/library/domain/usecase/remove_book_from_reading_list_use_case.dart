import 'package:injectable/injectable.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

@injectable
class RemoveBookFromReadingListUseCase {
  final LibraryRepo _libraryRepo;

  RemoveBookFromReadingListUseCase(this._libraryRepo);

  Future<void> call(String readingListId, String bookId) async {
    await _libraryRepo.removeBookFromReadingList(readingListId, bookId);
  }
}
