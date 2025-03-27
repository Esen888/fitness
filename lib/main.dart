import 'package:fitness/config/dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:media_kit/media_kit.dart';
import 'internal/application.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MediaKit.ensureInitialized();

  // ✅ Prevent Duplicate Firebase Initialization
  // if (Firebase.apps.isEmpty) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

  await setupServiceLocator();
  initializeDateFormatting('ru_RU', null);
    // WebViewPlatform.instance = WebWebViewPlatform();

 usePathUrlStrategy();
 
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
