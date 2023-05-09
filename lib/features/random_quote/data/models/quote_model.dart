import 'dart:math';

import 'package:quote_learn/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required String author,
      required String category,
      required int id,
      required String content})
      : super(content: content, category: category, author: author, id: id);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["id"] ?? Random().nextInt(1000),
        content: json["quote"],
        author: json["author"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": content,
        "author": author,
        "category": category,
      };
}
