class UserDto {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  UserDto({this.id, this.firstName, this.lastName, this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }
}
