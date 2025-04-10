// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class TelegramLoginScreen extends StatefulWidget {
//   @override
//   _TelegramLoginScreenState createState() => _TelegramLoginScreenState();
// }

// class _TelegramLoginScreenState extends State<TelegramLoginScreen> {
//   late WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Telegram Login"),
//       ),
//       body: WebView(
//         initialUrl: 'https://yourwebapp.com/telegram-login', // Ссылка на ваш сервер
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController;
//         },
//       ),
//     );
//   }
// }
