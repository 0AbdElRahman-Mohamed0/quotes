import 'package:dartz/dartz.dart';
import 'package:quote_learn/core/error/exceptions.dart';
import 'package:quote_learn/core/error/failures.dart';
import 'package:quote_learn/core/network_info/network_info.dart';
import 'package:quote_learn/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quote_learn/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quote_learn/features/random_quote/domain/entities/quote.dart';
import 'package:quote_learn/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImplementation implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImplementation({
    required this.randomQuoteRemoteDataSource,
    required this.networkInfo,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        return Right(remoteRandomQuote);
      } on ServerException catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException catch (e) {
        return Left(CacheFailure());
      }
    }
  }
}
