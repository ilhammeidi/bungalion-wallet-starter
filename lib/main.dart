import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/screens/not_found.dart';
import 'package:ewallet_app/ui/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/app/app_routes.dart';
import 'package:ewallet_app/ui/themes/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final RxString _themeMode = 'dark'.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _getThemeStatus() async {
    var mode = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('appTheme') ?? 'dark';
    }).obs;

    _themeMode.value = await mode.value;

    switch(_themeMode.value) {
      case 'dark':
        Get.changeThemeMode(ThemeMode.dark);
      break;
      case 'light':
        Get.changeThemeMode(ThemeMode.light);
      break;
      default:
      break;
    }
  }

  MainApp({super.key}) {
   _getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: branding.name,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightColorScheme,
      darkTheme: darkColorScheme,
      getPages: appRoutes,
      initialRoute: AppLink.home,
      unknownRoute: GetPage(
        name: AppLink.notFound,
        page: () => const DefaultLayout(title: 'Not Found', content: NotFound()),
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(boldText: false),
        child: child!,
      ),
    );
  }
}
