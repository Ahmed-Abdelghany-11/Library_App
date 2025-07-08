import '../../domain/entity/signin_request_entity.dart';

class SigninRequestDto {
  final String email;
  final String password;

  SigninRequestDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory SigninRequestDto.fromJson(Map<String, dynamic> json) {
    return SigninRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  factory SigninRequestDto.fromEntity(SigninRequestEntity entity) {
    return SigninRequestDto(email: entity.email, password: entity.password);
  }
}
