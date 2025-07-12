import 'package:library_app/features/home/data/model/book_dto.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookDto>> getSomeBooks();
  Future<List<BookDto>> getAllBooks();
  Future<BookDto> getBookById(String id);
  Future<List<BookDto>> getBooksByCategory(String category);
  Future<List<BookDto>> getBooksByRating(double rating);
}
