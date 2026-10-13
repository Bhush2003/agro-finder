import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/firebase_options.dart';
import 'package:agro_finder_project/presentation/farmer/login_screen/login_screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_screen/controller/service_controller.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize controllers
  Get.put(AuthController());
  Get.put(ServiceController(), permanent: true);

  // Load saved language
  final prefs = await SharedPreferences.getInstance();
  final savedLanguage = prefs.getString('language');
  Locale initialLocale = const Locale('en', 'US');

  if (savedLanguage != null) {
    switch (savedLanguage) {
      case 'English':
        initialLocale = const Locale('en', 'US');
        break;
      case 'मराठी':
        initialLocale = const Locale('mr', 'IN');
        break;
      case 'हिंदी':
        initialLocale = const Locale('hi', 'IN');
        break;
    }
  }

  runApp(MainApp(initialLocale: initialLocale));
}

class MainApp extends StatelessWidget {
  final Locale initialLocale;

  const MainApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agro Finder',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: initialLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTranslations(),
      home: const LoginScreen(),
    );
  }
}
