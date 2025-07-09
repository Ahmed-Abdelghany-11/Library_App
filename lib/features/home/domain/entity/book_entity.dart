class BookEntity {
  final String? id;
  final String? title;
  final String? author;
  final String? description;
  final List<String>? category;
  final String? coverUrl;
  final double? averageRating;
  final int? totalRatings;
  final String? language;
  final String? pageCount;

  BookEntity({
    this.id,
    this.title,
    this.author,
    this.description,
    this.category,
    this.coverUrl,
    this.averageRating,
    this.totalRatings,
    this.language,
    this.pageCount,
  });
}
