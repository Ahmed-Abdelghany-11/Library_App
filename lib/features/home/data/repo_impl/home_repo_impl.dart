import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_manager.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';
import 'package:library_app/features/home/domain/repo/home_repo.dart';

import '../data_source/contract/home_remote_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final ApiManager _apiManager;
  HomeRepoImpl(this._homeRemoteDataSource, this._apiManager);
  @override
  Future<Result<List<BookEntity>>> getAllBooks() async {
    return await _apiManager.execute<List<BookEntity>>(() async {
      final books = await _homeRemoteDataSource.getAllBooks();
      return books.map((book) => book.toEntity()).toList();
    });
  }

  @override
  Future<Result<BookEntity>> getBookById(String id) async {
    return await _apiManager.execute<BookEntity>(() async {
      final book = await _homeRemoteDataSource.getBookById(id);
      return book.toEntity();
    });
  }

  @override
  Future<Result<List<BookEntity>>> getBooksByCategory(String category) async {
    return await _apiManager.execute<List<BookEntity>>(() async {
      final books = await _homeRemoteDataSource.getBooksByCategory(category);
      return books.map((book) => book.toEntity()).toList();
    });
  }

  @override
  Future<Result<List<BookEntity>>> getBooksByRating(double rating) async {
    return await _apiManager.execute<List<BookEntity>>(() async {
      final books = await _homeRemoteDataSource.getBooksByRating(rating);
      return books.map((book) => book.toEntity()).toList();
    });
  }

  @override
  Future<Result<List<BookEntity>>> getSomeBooks() async {
    return await _apiManager.execute<List<BookEntity>>(() async {
      final books = await _homeRemoteDataSource.getSomeBooks();
      return books.map((book) => book.toEntity()).toList();
    });
  }
}
