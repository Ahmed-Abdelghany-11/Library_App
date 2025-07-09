class AddReviewEntity {
  final String bookId;
  final String reviewText;
  final int rating;
  final String userId;
  final String username;

  AddReviewEntity({
    required this.bookId,
    required this.reviewText,
    required this.rating,
    required this.userId,
    required this.username,
  });
}
