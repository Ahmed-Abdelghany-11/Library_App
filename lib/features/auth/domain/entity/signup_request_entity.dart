class SignupRequestEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;

  SignupRequestEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
  });
}
