import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_learn/app.dart';
import 'package:quote_learn/app_observer.dart';
import 'package:quote_learn/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  Bloc.observer = AppObserver();
  runApp(const QuoteApp());
}
