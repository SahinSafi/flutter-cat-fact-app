
import 'package:flutter_cat_fact_app/presentation/details/fact_details_screen.dart';
import 'package:flutter_cat_fact_app/presentation/home/home_screen.dart';

final appRoutes = {
  AppRoutesPath.homeScreen: (_) => const HomeScreen(),
  AppRoutesPath.factDetailsScreen: (_) => FactDetailsScreen(),
};

class AppRoutesPath {
  const AppRoutesPath._();

  static const homeScreen = "/";
  static const factDetailsScreen = "/factDetailsScreen";
}