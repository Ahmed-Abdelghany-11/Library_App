import '../../../../core/utils/networking/api_result.dart';
import '../entity/add_review_entity.dart';
import '../entity/review_entity.dart';
import '../entity/user_entity.dart';

abstract class BookDetailsRepo {
  Future<Result<List<ReviewEntity>>> getBookReviews(String bookId);
  Future<Result<void>> addBookReview(AddReviewEntity review);
  Future<Result<UserEntity>> getUserData(String userId);
}
