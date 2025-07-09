import '../../domain/entity/user_entity.dart';

class UserDto {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  UserDto({this.id, this.firstName, this.lastName, this.email});

  factory UserDto.fromFirestore(Map<String, dynamic> data, String id) {
    return UserDto(
      id: id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
