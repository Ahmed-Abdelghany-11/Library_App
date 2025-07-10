import '../../domain/entity/signup_request_entity.dart';

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

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }

  factory SignupRequestDto.fromEntity(SignupRequestEntity entity) {
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
