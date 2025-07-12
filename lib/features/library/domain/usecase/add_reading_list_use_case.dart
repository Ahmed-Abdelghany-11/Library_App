import 'package:injectable/injectable.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/reading_list_entity.dart';
import '../repo/library_repo.dart';

@injectable
class AddReadingListUseCase {
  final LibraryRepo _libraryRepo;

  AddReadingListUseCase(this._libraryRepo);

  Future<Result<void>> call(ReadingListEntity readingList) async {
    return _libraryRepo.addReadingList(readingList);
  }
}
