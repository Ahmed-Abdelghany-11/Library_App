import 'package:injectable/injectable.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/review_entity.dart';
import '../repo/book_details_repo.dart';

@injectable
class GetBookReviewsUseCase {
  final BookDetailsRepo _bookDetailsRepo;

  GetBookReviewsUseCase(this._bookDetailsRepo);

  Future<Result<List<ReviewEntity>>> call(String bookId) async {
    return await _bookDetailsRepo.getBookReviews(bookId);
  }
}
