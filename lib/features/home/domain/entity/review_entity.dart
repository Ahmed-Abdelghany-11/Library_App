class ReviewEntity {
  final String? id;
  final String? userId;
  final String? username;
  final String? reviewText;
  final double? rating;

  ReviewEntity({
    required this.id,
    required this.userId,
    required this.username,
    required this.reviewText,
    required this.rating,
  });
}
