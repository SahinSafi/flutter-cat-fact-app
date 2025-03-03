import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_fact_app/app_routes_path.dart';
import 'package:flutter_cat_fact_app/core/theme/theme.dart';
import 'package:flutter_cat_fact_app/presentation/home/home_screen.dart';
import 'core/di/injection_container.dart';
import 'my_bloc_observer.dart';

void main() async {
  Bloc.observer = const MyBlocObserver();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CatAppTheme.lightTheme,
      darkTheme: CatAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}

