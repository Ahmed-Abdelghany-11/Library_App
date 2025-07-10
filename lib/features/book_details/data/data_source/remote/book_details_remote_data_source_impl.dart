import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/features/book_details/data/data_source/contract/book_details_remote_data_source.dart';
import 'package:library_app/features/book_details/data/model/add_review_request_dto.dart';
import 'package:library_app/features/book_details/data/model/review_dto.dart';
import 'package:library_app/features/book_details/data/model/user_dto.dart';

@Injectable(as: BookDetailsRemoteDataSource)
class BookDetailsRemoteDataSourceImpl implements BookDetailsRemoteDataSource {
  final FirebaseFirestore firestore;
  BookDetailsRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ReviewDto>> getBookReviews(String bookId) async {
    final snapshot = await firestore
        .collection('books')
        .doc(bookId)
        .collection('reviews')
        .get();

    return snapshot.docs.map((doc) {
      return ReviewDto.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  @override
  Future<void> addBookReview(AddReviewRequestDto review) async {
    await firestore
        .collection('books')
        .doc(review.bookId)
        .collection('reviews')
        .add(review.toFirestore());

    await firestore.runTransaction((transaction) async {
      final bookRef = firestore.collection('books').doc(review.bookId);
      final bookSnapshot = await transaction.get(bookRef);
      final averageRating = bookSnapshot.data()?['averageRating'] ?? 0.0;
      final totalRatings = bookSnapshot.data()?['totalRatings'] ?? 0;

      final newAverageRating =
          ((averageRating * totalRatings) + review.rating) / (totalRatings + 1);

      transaction.update(bookRef, {
        'averageRating': newAverageRating,
        'totalRatings': totalRatings + 1,
      });
    });
  }

  @override
  Future<UserDto> getUserData(String userId) async {
    final snapshot = await firestore.collection('users').doc(userId).get();
    return UserDto.fromFirestore(snapshot.data()!, userId);
  }
}
