import '../../model/add_review_request_dto.dart';
import '../../model/review_dto.dart';
import '../../model/user_dto.dart';

abstract class BookDetailsRemoteDataSource {
  Future<List<ReviewDto>> getBookReviews(String bookId);
  Future<void> addBookReview(AddReviewRequestDto review);
  Future<UserDto> getUserData(String userId);
}
