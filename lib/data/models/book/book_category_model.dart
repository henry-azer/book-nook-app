import 'package:book_nook_app/data/entities/book/book_category.dart';

class BookCategoryModel extends BookCategory {
  const BookCategoryModel({required id, required name, required description})
      : super(id: id, name: name, description: description);

  factory BookCategoryModel.fromJson(Map<String, dynamic> json) =>
      BookCategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );
}
