import 'package:quote_learn/core/api/api_consumer.dart';
import 'package:quote_learn/core/api/end_points.dart';
import 'package:quote_learn/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImplementation
    implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImplementation({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson(response[0]);
  }
}
