import 'package:equatable/equatable.dart';

class BookCategory extends Equatable {
  final int? id;
  final String? name;
  final String? description;

  const BookCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  factory BookCategory.fromJson(Map<String, dynamic> json) => BookCategory(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  @override
  List<Object?> get props => [id];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
