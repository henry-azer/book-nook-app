import 'package:equatable/equatable.dart';

import '../author/author.dart';
import 'book_category.dart';

class Book extends Equatable {
  final int? id;
  final Author? author;
  final String? name;
  final double? rate;
  final int? usersRateCount;
  final BookCategory? category;
  final double? price;
  final int? pagesNumber;
  final int? readingDuration;
  final DateTime? publishDate;
  final String? description;
  final String? imageUrl;

  const Book({
    required this.id,
    required this.author,
    required this.name,
    required this.rate,
    required this.usersRateCount,
    required this.category,
    required this.price,
    required this.pagesNumber,
    required this.readingDuration,
    required this.publishDate,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id];

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        author: Author.fromJson(json["author"]),
        name: json["name"],
        rate: json["rate"],
        usersRateCount: json["usersRateCount"],
        category: BookCategory.fromJson(json["category"]),
        price: json["price"].toDouble(),
        pagesNumber: json["pagesNumber"],
        readingDuration: json["readingDuration"],
        publishDate: DateTime.tryParse(json["publishDate"]),
        description: json["description"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author?.toJson(),
        "name": name,
        "rate": rate,
        "usersRateCount": usersRateCount,
        "category": category?.toJson(),
        "price": price,
        "pagesNumber": pagesNumber,
        "readingDuration": readingDuration,
        "publishDate": publishDate?.toIso8601String(),
        "description": description,
        "imageUrl": imageUrl,
      };
}
