import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quote_learn/core/api/api_consumer.dart';
import 'package:quote_learn/core/api/app_interceptors.dart';
import 'package:quote_learn/core/api/dio_consumer.dart';
import 'package:quote_learn/core/network_info/network_info.dart';
import 'package:quote_learn/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quote_learn/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quote_learn/features/random_quote/data/repositories/quote_repository_implementation.dart';
import 'package:quote_learn/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quote_learn/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quote_learn/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  // Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));

  // Repositories
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImplementation(
        randomQuoteRemoteDataSource: sl(),
        networkInfo: sl(),
        randomQuoteLocalDataSource: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImplementation(sharedPreferences: sl()));

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImplementation(apiConsumer: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        error: true,
      ));
  // sl.registerLazySingleton(() => LogInterceptor(
  //     request: true,
  //     requestBody: true,
  //     requestHeader: true,
  //     responseBody: true,
  //     responseHeader: true,
  //     error: true));
}
