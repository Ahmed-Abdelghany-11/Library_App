import '../../domain/entity/review_entity.dart';

class ReviewDto {
  final String? id;
  final String? userId;
  final String? username;
  final String? reviewText;
  final double? rating;

  ReviewDto({
    this.id,
    this.userId,
    this.username,
    this.reviewText,
    this.rating,
  });

  factory ReviewDto.fromFirestore(Map<String, dynamic> data, String id) {
    return ReviewDto(
      id: id,
      userId: data['userId'] ?? '',
      username: data['username'] ?? '',
      reviewText: data['reviewText'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      userId: userId,
      username: username,
      reviewText: reviewText,
      rating: rating,
    );
  }
}
