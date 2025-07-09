import '../../domain/entity/add_review_entity.dart';

class AddReviewRequestDto {
  final String bookId;
  final String reviewText;
  final int rating;
  final String userId;
  final String username;

  AddReviewRequestDto({
    required this.bookId,
    required this.reviewText,
    required this.rating,
    required this.userId,
    required this.username,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'reviewText': reviewText,
      'rating': rating,
      'userId': userId,
      'username': username,
    };
  }

  factory AddReviewRequestDto.fromEntity(AddReviewEntity entity) {
    return AddReviewRequestDto(
      bookId: entity.bookId,
      reviewText: entity.reviewText,
      rating: entity.rating,
      userId: entity.userId,
      username: entity.username,
    );
  }
}
