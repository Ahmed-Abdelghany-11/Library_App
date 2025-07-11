import 'package:library_app/features/home/domain/entity/book_entity.dart';

class BookDto {
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

  BookDto({
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

  factory BookDto.fromFirestore(Map<String, dynamic> data, String id) {
    return BookDto(
      id: id,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      description: data['description'] ?? '',
      category: List<String>.from(data['category'] ?? []),
      coverUrl: data['coverUrl'] ?? '',
      averageRating: (data['averageRating'] ?? 0).toDouble(),
      totalRatings: data['totalRatings'] ?? 0,
      language: data['language'] ?? '',
      pageCount: data['pageCount'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'category': category ?? [],
      'coverUrl': coverUrl,
      'averageRating': averageRating ?? 0.0,
      'totalRatings': totalRatings ?? 0,
      'language': language,
      'pageCount': pageCount ?? '',
    };
  }

  BookEntity toEntity() {
    return BookEntity(
      id: id,
      title: title,
      author: author,
      description: description,
      category: category,
      coverUrl: coverUrl,
      averageRating: averageRating,
      totalRatings: totalRatings,
      language: language,
      pageCount: pageCount,
    );
  }

  factory BookDto.fromEntity(BookEntity entity) {
    return BookDto(
      id: entity.id,
      title: entity.title,
      author: entity.author,
      description: entity.description,
      category: entity.category,
      coverUrl: entity.coverUrl,
      averageRating: entity.averageRating,
      totalRatings: entity.totalRatings,
      language: entity.language,
      pageCount: entity.pageCount,
    );
  }
}
