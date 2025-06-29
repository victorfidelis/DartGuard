import 'package:dart_guard/app/modules/main/views/webview/webview_view.dart';
import 'package:dart_guard/app/modules/main/views/wrapper/wrapper_view.dart';
import 'package:flutter/material.dart';

Route<dynamic>? appRoute(RouteSettings settings) {
  if (settings.name == '/wrapper') {
    return _buildRoute(settings, const WrapperView());
  }
  if (settings.name == '/webview') {
    final args = settings.arguments as Map<String, dynamic>;
    return _buildRoute(settings, WebviewView(url: args['url']));
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(settings: settings, builder: (ctx) => builder);
}
