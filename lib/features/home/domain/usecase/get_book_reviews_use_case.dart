import 'package:injectable/injectable.dart';
import 'package:library_app/features/home/domain/repo/home_repo.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../entity/review_entity.dart';

@injectable
class GetBookReviewsUseCase {
  final HomeRepo _homeRepo;

  GetBookReviewsUseCase(this._homeRepo);

  Future<Result<List<ReviewEntity>>> call(String bookId) async {
    return await _homeRepo.getBookReviews(bookId);
  }
}
