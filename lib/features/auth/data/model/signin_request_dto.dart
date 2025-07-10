import '../../domain/entity/signin_request_entity.dart';

class SigninRequestDto {
  final String email;
  final String password;

  SigninRequestDto({required this.email, required this.password});

  factory SigninRequestDto.fromEntity(SigninRequestEntity entity) {
    return SigninRequestDto(email: entity.email, password: entity.password);
  }
}
