import 'package:fitness/features/blogger/presentation/widgets/webview_navigation_controls.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyCourseScreen extends StatefulWidget {
  final String urlOfWeb;

  const BuyCourseScreen({super.key, required this.urlOfWeb});

  @override
  State<BuyCourseScreen> createState() => _BuyCourseScreenState();
}

class _BuyCourseScreenState extends State<BuyCourseScreen> {
  late WebViewController controller;
  int loadingPercentage = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.urlOfWeb),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          actions: [NavigationControls(controller: controller)],
          title: const Text('Получить курс'),
        ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
  }
}
