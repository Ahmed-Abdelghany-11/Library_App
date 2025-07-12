import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_manager.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';
import 'package:library_app/features/library/domain/repo/library_repo.dart';

import '../../domain/entity/reading_list_entity.dart';
import '../data_source/contract/library_remote_data_source.dart';
import '../model/reading_list_dto.dart';

@Injectable(as: LibraryRepo)
class LibraryRepoImpl implements LibraryRepo {
  final ApiManager _apiManager;
  final LibraryRemoteDataSource _libraryRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  LibraryRepoImpl(
    this._apiManager,
    this._libraryRemoteDataSource,
    this._authLocalDataSource,
  );
  @override
  Future<Result<void>> addReadingList(ReadingListEntity readingList) async {
    final userId = await _authLocalDataSource.getUserId();
    final readingListDto = ReadingListDto.fromEntity(readingList);
    return _apiManager.execute(
      () async => await _libraryRemoteDataSource.addReadingList(
        userId!,
        readingListDto,
      ),
    );
  }

  @override
  Future<Result<void>> deleteReadingList(String readingListId) async {
    final userId = await _authLocalDataSource.getUserId();
    return _apiManager.execute(
      () async => await _libraryRemoteDataSource.deleteReadingList(
        userId!,
        readingListId,
      ),
    );
  }

  @override
  Future<Result<List<BookEntity>>> getBooksInReadingList(
    String readingListId,
  ) async {
    final userId = await _authLocalDataSource.getUserId();
    return _apiManager.execute<List<BookEntity>>(() async {
      final result = await _libraryRemoteDataSource.getBooksInReadingList(
        userId!,
        readingListId,
      );
      return result.map((book) => book.toEntity()).toList();
    });
  }

  @override
  Future<Result<ReadingListEntity>> getReadingListByName(
    String readingListName,
  ) async {
    final userId = await _authLocalDataSource.getUserId();
    return _apiManager.execute<ReadingListEntity>(() async {
      final readingList = await _libraryRemoteDataSource.getReadingListByName(
        userId!,
        readingListName,
      );
      return readingList.toEntity();
    });
  }

  @override
  Future<Result<List<ReadingListEntity>>> getReadingLists() async {
    final userId = await _authLocalDataSource.getUserId();
    return _apiManager.execute<List<ReadingListEntity>>(() async {
      final result = await _libraryRemoteDataSource.getReadingLists(userId!);
      return result.map((readingList) => readingList.toEntity()).toList();
    });
  }

  @override
  Future<Result<void>> removeBookFromReadingList(
    String readingListId,
    String title,
  ) async {
    final userId = await _authLocalDataSource.getUserId();
    return _apiManager.execute(
      () async => await _libraryRemoteDataSource.removeBookFromReadingList(
        userId!,
        readingListId,
        title,
      ),
    );
  }
}
