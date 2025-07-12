import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/data/model/book_dto.dart';

import '../contract/home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;
  HomeRemoteDataSourceImpl(this.firestore);
  @override
  Future<List<BookDto>> getAllBooks() async {
    final data = await firestore.collection('books').get();

    return data.docs.map((doc) {
      return BookDto.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  @override
  Future<BookDto> getBookById(String id) async {
    final doc = await firestore.collection('books').doc(id).get();
    return BookDto.fromFirestore(doc.data()!, doc.id);
  }

  @override
  Future<List<BookDto>> getBooksByCategory(String category) async {
    final data = await firestore
        .collection('books')
        .where('category', arrayContains: category)
        .get();

    return data.docs.map((doc) {
      return BookDto.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  @override
  Future<List<BookDto>> getBooksByRating(double rating) async {
    final data = await firestore
        .collection('books')
        .where('averageRating', isGreaterThanOrEqualTo: rating)
        .get();

    return data.docs.map((doc) {
      return BookDto.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  @override
  Future<List<BookDto>> getSomeBooks() async {
    final data = await firestore.collection('books').limit(5).get();

    return data.docs.map((doc) {
      return BookDto.fromFirestore(doc.data(), doc.id);
    }).toList();
  }
}
