import 'package:library_app/features/home/domain/entity/book_entity.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/add_review_entity.dart';
import '../entity/review_entity.dart';
import '../entity/user_entity.dart';

abstract class BookDetailsRepo {
  Future<Result<List<ReviewEntity>>> getBookReviews(String bookId);
  Future<Result<void>> addBookReview(AddReviewEntity review);
  Future<Result<UserEntity>> getUserData();
  Future<Result<void>> addBookToReadingList(
    String readingListId,
    BookEntity book,
  );
}
