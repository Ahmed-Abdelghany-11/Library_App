import 'package:injectable/injectable.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/add_review_entity.dart';
import '../repo/book_details_repo.dart';

@injectable
class AddBookReviewUseCase {
  final BookDetailsRepo _bookDetailsRepo;
  AddBookReviewUseCase(this._bookDetailsRepo);

  Future<Result<void>> call(AddReviewEntity review) async {
    return await _bookDetailsRepo.addBookReview(review);
  }
}
