import 'package:injectable/injectable.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/reading_list_entity.dart';

@injectable
class GetReadingListsUseCase {
  final LibraryRepo _libraryRepo;
  GetReadingListsUseCase(this._libraryRepo);

  Future<Result<List<ReadingListEntity>>> call() async {
    return _libraryRepo.getReadingLists();
  }
}
