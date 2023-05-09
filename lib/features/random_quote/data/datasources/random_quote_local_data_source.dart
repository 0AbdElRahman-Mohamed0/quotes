import 'package:quote_learn/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote();
}
