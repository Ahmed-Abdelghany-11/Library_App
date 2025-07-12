import 'package:injectable/injectable.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/reading_list_entity.dart';

@injectable
class GetReadingListByNameUseCase {
  final LibraryRepo _libraryRepo;

  GetReadingListByNameUseCase(this._libraryRepo);

  Future<Result<ReadingListEntity>> call(String name) async {
    return _libraryRepo.getReadingListByName(name);
  }
}
