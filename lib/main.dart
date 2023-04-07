import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/auth_provider.dart';
import 'package:setup_provider/application/home_provider.dart';
import 'package:setup_provider/domain/di/di.dart';
import 'application/app_provider.dart';
import 'application/main_provider.dart';
import 'presentation/app_widget.dart';
import 'presentation/style/style.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Style.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  setUp();
  runApp(
    EasyLocalization(
      supportedLocales: const [ Locale("uz", "UZ")],
      path: 'assets/tr',
      startLocale: const Locale("uz", "UZ"),
      fallbackLocale: const Locale("uz", "UZ"),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => AppProvider()..setTheme(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => AuthProvider(authRepo),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => MainProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => HomeProvider(homeRepo),
          ),
        ],
        child: const AppWidget(),
      ),
    ),
  );
}
