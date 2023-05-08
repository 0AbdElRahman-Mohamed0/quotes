import 'package:dartz/dartz.dart';
import 'package:quote_learn/core/error/failures.dart';
import 'package:quote_learn/features/random_quote/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
