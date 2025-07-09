import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_manager.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';
import 'package:library_app/features/search/domain/repo/search_repo.dart';

import '../data_source/contract/search_remote_data_source.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource _remoteDataSource;
  final ApiManager _apiManager;
  SearchRepoImpl(this._remoteDataSource, this._apiManager);
  @override
  Future<Result<List<BookEntity>>> searchBook(String query) async {
    return await _apiManager.execute<List<BookEntity>>(() async {
      final books = await _remoteDataSource.searchBook(query);
      return books.map((book) => book.toEntity()).toList();
    });
  }
}
