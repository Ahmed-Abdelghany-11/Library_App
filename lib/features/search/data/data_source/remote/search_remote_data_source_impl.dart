import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../home/data/model/book_dto.dart';
import '../contract/search_remote_data_source.dart';

@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final FirebaseFirestore _firestore;
  SearchRemoteDataSourceImpl(this._firestore);
  @override
  Future<List<BookDto>> searchBook(String query) async {
    final booksCollection = _firestore.collection('books');
    final books = await booksCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: '$query\uf8ff')
        .get();
    return books.docs
        .map((doc) => BookDto.fromFirestore(doc.data(), doc.id))
        .toList();
  }
}
