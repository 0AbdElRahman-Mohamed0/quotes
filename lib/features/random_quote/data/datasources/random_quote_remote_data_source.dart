import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_learn/core/api/end_points.dart';
import 'package:quote_learn/core/error/exceptions.dart';
import 'package:quote_learn/core/utils/app_strings.dart';
import 'package:quote_learn/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImplementation
    implements RandomQuoteRemoteDataSource {
  http.Client client;
  RandomQuoteRemoteDataSourceImplementation({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuote = Uri.parse(EndPoints.randomQuote);
    final response = await client.get(randomQuote, headers: {
      AppStrings.contentType: AppStrings.applicationJson,
      AppStrings.xApiKey: AppStrings.key,
    });
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
