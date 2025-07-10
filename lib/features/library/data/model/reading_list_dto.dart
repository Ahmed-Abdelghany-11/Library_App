import 'package:library_app/features/library/domain/entity/reading_list_entity.dart';

class ReadingListDto {
  final String? name;
  final int? numberOfBooks;

  ReadingListDto({this.name, this.numberOfBooks});

  factory ReadingListDto.fromFirestore(Map<String, dynamic> json) {
    return ReadingListDto(
      name: json['name'] as String?,
      numberOfBooks: json['numberOfBooks'] as int?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'numberOfBooks': numberOfBooks};
  }

  ReadingListEntity toEntity() {
    return ReadingListEntity(name: name, numberOfBooks: numberOfBooks);
  }

  factory ReadingListDto.fromEntity(ReadingListEntity entity) {
    return ReadingListDto(
      name: entity.name,
      numberOfBooks: entity.numberOfBooks,
    );
  }
}
