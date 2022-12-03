import '../../entities/user/user.dart';

class UserModel extends User {
  const UserModel(
      {required firstName,
      required lastName,
      required id,
      required email,
      required password,
      required birthdate,
      required phoneNumber})
      : super(
            firstName: firstName,
            lastName: lastName,
            id: id,
            email: email,
            password: password,
            birthdate: birthdate,
            phoneNumber: phoneNumber);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"] ?? "Empty",
        password: json["password"] ?? "Empty",
        firstName: json["firstName"] ?? "Empty",
        lastName: json["lastName"] ?? "Empty",
        birthdate: json["birthdate"] ?? "Empty",
        phoneNumber: json["phoneNumber"] ?? "Empty",
      );
}
