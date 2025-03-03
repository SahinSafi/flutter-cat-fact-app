import 'package:flutter/material.dart';

extension Navigation on BuildContext {

  Future<T?>navigateTo<T extends Object?>({required String routeName, Object? arguments}) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  Future<T?>navigateToAndRemoveUntil<T extends Object?>({required String routeName, Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil<T>(this, routeName, (route) => false, arguments: arguments);
  }

  Object? get arguments => ModalRoute.of(this)!.settings.arguments;

}