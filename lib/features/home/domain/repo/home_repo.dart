import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';

abstract class HomeRepo {
  Future<Result<List<BookEntity>>> getSomeBooks();
  Future<Result<List<BookEntity>>> getAllBooks();
  Future<Result<BookEntity>> getBookById(String id);
  Future<Result<List<BookEntity>>> getBooksByCategory(String category);
  Future<Result<List<BookEntity>>> getBooksByRating(double rating);
}
