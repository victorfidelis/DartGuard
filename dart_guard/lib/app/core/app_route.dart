import 'package:dart_guard/app/core/wrapper_view.dart';
import 'package:flutter/material.dart';

Route<dynamic>? appRoute(RouteSettings settings) {
  if (settings.name == '/wrapper') {
    return _buildRoute(settings, const WrapperView());
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(settings: settings, builder: (ctx) => builder);
}