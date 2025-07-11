import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/data/model/book_dto.dart';
import 'package:library_app/features/library/data/data_source/contract/library_remote_data_source.dart';
import 'package:library_app/features/library/data/model/reading_list_dto.dart';

@Injectable(as: LibraryRemoteDataSource)
class LibraryRemoteDataSourceImpl implements LibraryRemoteDataSource {
  final FirebaseFirestore firestore;
  LibraryRemoteDataSourceImpl(this.firestore);
  @override
  Future<void> addReadingList(String userId, ReadingListDto readingList) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('readingLists')
        .add(readingList.toFirestore());
  }

  @override
  Future<void> deleteReadingList(String userId, String readingListId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('readingLists')
        .where('id', isEqualTo: readingListId)
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<List<BookDto>> getBooksInReadingList(
    String userId,
    String readingListId,
  ) async {
    final snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('readingLists')
        .doc(readingListId)
        .collection('books')
        .get();

    return snapshot.docs.map((doc) {
      return BookDto.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  @override
  Future<List<ReadingListDto>> getReadingLists(String userId) async {
    final snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('readingLists')
        .get();

    return snapshot.docs.map((doc) {
      return ReadingListDto.fromFirestore(doc.data());
    }).toList();
  }

  @override
  Future<void> removeBookFromReadingList(
    String userId,
    String readingListId,
    String bookId,
  ) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('readingLists')
        .doc(readingListId)
        .collection('books')
        .doc(bookId)
        .delete();
  }

  @override
  Future<ReadingListDto> getReadingListByName(
    String userId,
    String readingListName,
  ) async {
    final snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('readingLists')
        .where('name', isEqualTo: readingListName)
        .get();

    return ReadingListDto.fromFirestore(snapshot.docs.first.data());
  }
}
