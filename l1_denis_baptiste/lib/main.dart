// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'routes/routes.dart';
import 'routes/pages.dart';
import 'util/translation.dart';
import 'util/style.dart';
import 'screens/loading.dart';
import 'screens/error.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  /*@override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: movieAppKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter The Movie DB',
      translations: GetTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: GetTranslations.fallbackLocale,
      theme: Style.lightTheme,
      darkTheme: Style.darkTheme,
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.HOME,
      enableLog: true,
      logWriterCallback: (String text, {bool isError = false}) {
        debugPrint("GetXLog: $text");
      },
    );
  }*/
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  static GlobalKey movieAppKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseAuth auth = FirebaseAuth.instance;
          return GetMaterialApp(
            key: movieAppKey,
            debugShowCheckedModeBanner: false,
            title: 'Flutter The Movie DB',
            translations: GetTranslations(),
            locale: Get.deviceLocale,
            fallbackLocale: GetTranslations.fallbackLocale,
            theme: Style.lightTheme,
            darkTheme: Style.darkTheme,
            themeMode: ThemeMode.dark,
            defaultTransition: Transition.fadeIn,
            getPages: AppPages.routes,
            initialRoute: AppRoutes.HOME,
            enableLog: true,
            logWriterCallback: (String text, {bool isError = false}) {
              debugPrint("GetXLog: $text");
            },
          );
        }

        return const LoadingScreen();
      },
    );
  }
}
