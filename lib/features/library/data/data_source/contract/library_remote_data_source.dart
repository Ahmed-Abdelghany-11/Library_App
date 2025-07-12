import '../../../../home/data/model/book_dto.dart';
import '../../model/reading_list_dto.dart';

abstract class LibraryRemoteDataSource {
  Future<List<ReadingListDto>> getReadingLists(String userId);
  Future<void> addReadingList(String userId, ReadingListDto readingList);
  Future<List<BookDto>> getBooksInReadingList(
    String userId,
    String readingListId,
  );
  Future<void> removeBookFromReadingList(
    String userId,
    String readingListId,
    String bookId,
  );
  Future<void> deleteReadingList(String userId, String readingListId);
  Future<ReadingListDto> getReadingListByName(
    String userId,
    String readingListName,
  );
}
