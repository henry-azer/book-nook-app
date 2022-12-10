import '../../entities/author/author.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required id,
    required description,
    required birthdate,
    required name,
    required deathdate,
    required country,
    required age,
    required gender,
    required imageUrl,
  }) : super(
            id: id,
            name: name,
            description: description,
            birthdate: birthdate,
            deathdate: deathdate,
            country: country,
            age: age,
            gender: gender,
            imageUrl: imageUrl);

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        birthdate: json["birthdate"] != null ? DateTime.tryParse(json["birthdate"]) : json["birthdate"],
        deathdate: json["deathdate"] != null ? DateTime.tryParse(json["deathdate"]) : json["deathdate"],
        country: json["country"],
        age: json["age"],
        gender: json["gender"],
        imageUrl: json["imageUrl"],
      );
}
