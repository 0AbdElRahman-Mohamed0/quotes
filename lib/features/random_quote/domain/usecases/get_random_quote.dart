import 'package:dartz/dartz.dart';
import 'package:quote_learn/core/error/failures.dart';
import 'package:quote_learn/core/usecases/usecase.dart';
import 'package:quote_learn/features/random_quote/domain/entities/quote.dart';
import 'package:quote_learn/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}
