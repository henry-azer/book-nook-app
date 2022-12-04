class SignupRequest {
  late String firstname;
  late String lastname;
  late String birthDay;
  late String birthMonth;
  late String birthYear;
  late String phoneNumber;
  late String email;
  late String password;
  late String confirmPassword;

  SignupRequest(
      {required this.firstname,
      required this.lastname,
      required this.birthDay,
      required this.birthMonth,
      required this.birthYear,
      required this.phoneNumber,
      required this.email,
      required this.password,
      required this.confirmPassword});

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        birthDay: json["birthDay"] ?? "",
        birthMonth: json["birthMonth"] ?? "",
        birthYear: json["birthYear"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        confirmPassword: json["confirmPassword"] ?? "",
      );
}
