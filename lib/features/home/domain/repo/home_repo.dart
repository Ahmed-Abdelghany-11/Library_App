import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';

import '../entity/review_entity.dart';

abstract class HomeRepo {
  Future<Result<List<BookEntity>>> getAllBooks();
  Future<Result<BookEntity>> getBookById(String id);
  Future<Result<List<ReviewEntity>>> getBookReviews(String bookId);
}
