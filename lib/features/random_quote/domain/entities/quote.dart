import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final int id;
  final String author;
  final String content;
  final String category;

  const Quote(
      {required this.author,
      required this.category,
      required this.id,
      required this.content});

  @override
  List<Object?> get props => [id, author, category, content];
}
