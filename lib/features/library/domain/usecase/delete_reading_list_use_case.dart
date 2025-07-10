import 'package:injectable/injectable.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

@injectable
class DeleteReadingListUseCase {
  final LibraryRepo _libraryRepo;

  DeleteReadingListUseCase(this._libraryRepo);

  Future<void> call(String readingListId) async {
    await _libraryRepo.deleteReadingList(readingListId);
  }
}
