import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

@injectable
class DeleteReadingListUseCase {
  final LibraryRepo _libraryRepo;

  DeleteReadingListUseCase(this._libraryRepo);

  Future<Result<void>> call(String readingListId) async {
    return await _libraryRepo.deleteReadingList(readingListId);
  }
}
