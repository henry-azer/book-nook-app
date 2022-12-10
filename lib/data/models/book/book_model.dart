import 'package:book_nook_app/data/entities/book/book.dart';
import 'package:book_nook_app/data/models/author/author_model.dart';
import 'package:book_nook_app/data/models/book/book_category_model.dart';

class BookModel extends Book {
  const BookModel(
      {required id,
      required author,
      required name,
      required rate,
      required usersRateCount,
      required category,
      required price,
      required pagesNumber,
      required readingDuration,
      required publishDate,
      required description,
      required imageUrl})
      : super(
            id: id,
            author: author,
            name: name,
            rate: rate,
            usersRateCount: usersRateCount,
            category: category,
            price: price,
            pagesNumber: pagesNumber,
            readingDuration: readingDuration,
            publishDate: publishDate,
            description: description,
            imageUrl: imageUrl);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        author: AuthorModel.fromJson(json["author"]),
        name: json["name"],
        rate: json["rate"],
        usersRateCount: json["usersRateCount"],
        category: BookCategoryModel.fromJson(json["category"]),
        price: json["price"].toDouble(),
        pagesNumber: json["pagesNumber"],
        readingDuration: json["readingDuration"],
        publishDate: DateTime.tryParse(json["publishDate"]),
        description: json["description"],
        imageUrl: json["imageUrl"],
      );
}
