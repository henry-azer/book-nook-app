import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? birthdate;
  final DateTime? deathdate;
  final String? country;
  final int? age;
  final String? gender;
  final String? imageUrl;

  const Author({
    required this.id,
    required this.name,
    required this.description,
    required this.birthdate,
    required this.deathdate,
    required this.country,
    required this.age,
    required this.gender,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id];

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "birthdate": birthdate?.toIso8601String(),
        "deathdate": deathdate?.toIso8601String(),
        "country": country,
        "age": age,
        "gender": gender,
        "imageUrl": imageUrl,
      };
}
