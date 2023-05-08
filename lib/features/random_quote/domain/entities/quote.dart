import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  int id;
  String author;
  String content;
  String category;

  Quote(
      {required this.author,
      required this.category,
      required this.id,
      required this.content});

  @override
  List<Object?> get props => [id, author, category, content];
}
