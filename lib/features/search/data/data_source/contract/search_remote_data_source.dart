import 'package:library_app/features/home/data/model/book_dto.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookDto>> searchBook(String query);
}
