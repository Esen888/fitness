import 'package:fitness/config/dependency_injection/locator.dart';
import 'package:fitness/config/theme/change_theme_provider.dart';
import 'package:fitness/core/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'core/utils/firebase_options.dart';
import 'internal/application.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
