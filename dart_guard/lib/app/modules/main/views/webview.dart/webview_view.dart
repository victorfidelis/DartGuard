import 'package:dart_guard/app/shared/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewView extends StatefulWidget {
  final String url;
  const WebviewView({super.key, required this.url});

  @override
  State<WebviewView> createState() => _WebviewViewState();
}

class _WebviewViewState extends State<WebviewView> {
  late final WebViewController webviewController;

  @override
  void initState() {
    webviewController =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SizedBox(height: 26, child: const AppLogo()), centerTitle: true),
      body: WebViewWidget(controller: webviewController),
    );
  }
}
