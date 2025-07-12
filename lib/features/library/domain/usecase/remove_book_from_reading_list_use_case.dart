import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

@injectable
class RemoveBookFromReadingListUseCase {
  final LibraryRepo _libraryRepo;

  RemoveBookFromReadingListUseCase(this._libraryRepo);

  Future<Result<void>> call(String readingListId, String title) async {
    return await _libraryRepo.removeBookFromReadingList(readingListId, title);
  }
}
