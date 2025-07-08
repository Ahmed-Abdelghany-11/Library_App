import '../../domain/entity/user_request_entity.dart';

class SignupRequestDto {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;

  SignupRequestDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  SignupRequestDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }

  factory SignupRequestDto.fromEntity(UserRequestEntity entity) {
    return SignupRequestDto(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
    );
  }
}
