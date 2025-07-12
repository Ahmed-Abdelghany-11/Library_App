import 'package:library_app/features/library/domain/entity/reading_list_entity.dart';

class ReadingListDto {
  final String? name;
  final int? numberOfBooks;
  final String? id;

  ReadingListDto({this.name, this.numberOfBooks, this.id});

  factory ReadingListDto.fromFirestore(Map<String, dynamic> json) {
    return ReadingListDto(
      name: json['name'] as String?,
      numberOfBooks: json['numberOfBooks'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'numberOfBooks': numberOfBooks, 'id': id};
  }

  ReadingListEntity toEntity() {
    return ReadingListEntity(name: name, numberOfBooks: numberOfBooks, id: id);
  }

  factory ReadingListDto.fromEntity(ReadingListEntity entity) {
    return ReadingListDto(
      name: entity.name,
      numberOfBooks: entity.numberOfBooks,
      id: entity.id,
    );
  }
}
