import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/networking/api_manager.dart';
import 'package:library_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:library_app/features/book_details/domain/entity/user_entity.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../../../home/data/model/book_dto.dart';
import '../../../home/domain/entity/book_entity.dart';
import '../../domain/entity/add_review_entity.dart';
import '../../domain/entity/review_entity.dart';
import '../../domain/repo/book_details_repo.dart';
import '../data_source/contract/book_details_remote_data_source.dart';
import '../model/add_review_request_dto.dart';

@Injectable(as: BookDetailsRepo)
class BookDetailsRepoImpl implements BookDetailsRepo {
  final ApiManager _apiManager;
  final BookDetailsRemoteDataSource _bookDetailsRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  BookDetailsRepoImpl(
    this._bookDetailsRemoteDataSource,
    this._apiManager,
    this._authLocalDataSource,
  );

  @override
  Future<Result<List<ReviewEntity>>> getBookReviews(String bookId) async {
    return await _apiManager.execute<List<ReviewEntity>>(() async {
      final reviews = await _bookDetailsRemoteDataSource.getBookReviews(bookId);
      return reviews.map((review) => review.toEntity()).toList();
    });
  }

  @override
  Future<Result<void>> addBookReview(AddReviewEntity review) async {
    final req = AddReviewRequestDto.fromEntity(review);
    return await _apiManager.execute<void>(() async {
      await _bookDetailsRemoteDataSource.addBookReview(req);
    });
  }

  @override
  Future<Result<UserEntity>> getUserData() async {
    final userId = await _authLocalDataSource.getUserId();
    return await _apiManager.execute<UserEntity>(() async {
      final userDto = await _bookDetailsRemoteDataSource.getUserData(userId!);
      return userDto.toEntity();
    });
  }

  @override
  Future<Result<void>> addBookToReadingList(
    String readingListId,
    BookEntity book,
  ) async {
    final userId = await _authLocalDataSource.getUserId();
    final bookDto = BookDto.fromEntity(book);
    return await _apiManager.execute<void>(() async {
      return await _bookDetailsRemoteDataSource.addBookToReadingList(
        userId!,
        readingListId,
        bookDto,
      );
    });
  }
}
