import 'package:library_app/features/home/data/model/book_dto.dart';

import '../../model/review_dto.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookDto>> getAllBooks();
  Future<BookDto> getBookById(String id);
  Future<List<ReviewDto>> getBookReviews(String bookId);
}
