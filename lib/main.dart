import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/ui/media/themes.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.router.dart';
import 'constants/strings.dart';
import 'services/third_party/easyloading/easyloading.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await ThemeManager.initialise();
    await setupLocator();
    runApp(MyApp());
  }, reportError);
}

void reportError(Object error, StackTrace stackTrace) async {
  FirebaseCrashlytics.instance.recordError(error,stackTrace);
  debugPrint(
      '(ERROR) main.dart:main() error: ${error.toString()} stack-trace: ${stackTrace.toString()}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      darkTheme: AppTheme().darkTheme,
      lightTheme: AppTheme().lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: APP_NAME,
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        builder: locator<EasyLoadingService>().initialize(),
      ),
    );
  }
}
