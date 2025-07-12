import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';
import 'package:library_app/features/library/domain/entity/reading_list_entity.dart';

abstract class LibraryRepo {
  Future<Result<List<ReadingListEntity>>> getReadingLists();
  Future<Result<void>> addReadingList(ReadingListEntity readingList);
  Future<Result<List<BookEntity>>> getBooksInReadingList(String readingListId);
  Future<Result<void>> removeBookFromReadingList(
    String readingListId,
    String title,
  );
  Future<Result<void>> deleteReadingList(String readingListId);
  Future<Result<ReadingListEntity>> getReadingListByName(
    String readingListName,
  );
}
