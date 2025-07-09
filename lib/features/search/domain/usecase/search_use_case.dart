import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/search/domain/repo/search_repo.dart';

import '../../../home/domain/entity/book_entity.dart';

@injectable
class SearchUseCase {
  final SearchRepo _searchRepo;
  SearchUseCase(this._searchRepo);

  Future<Result<List<BookEntity>>> call(String query) async {
    return await _searchRepo.searchBook(query);
  }
}
