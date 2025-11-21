// SCREEN
import 'package:ewallet_app/screens/intro/intro_screen.dart';
import 'package:ewallet_app/screens/intro/start_screen.dart';
import 'package:ewallet_app/screens/messages/notification_screen.dart';
import 'package:ewallet_app/screens/not_found.dart';
import 'package:ewallet_app/screens/profile/profile_screen.dart';
import 'package:ewallet_app/screens/wallet/scan_qr.dart';
import 'package:ewallet_app/ui/layouts/default_layout.dart';
import 'package:ewallet_app/ui/layouts/general_layout.dart';
import 'package:ewallet_app/ui/layouts/home_layout.dart';
import 'package:ewallet_app/screens/promo/promo_screen.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/app/app_link.dart';

const int pageTransitionDuration = 200;

final List<GetPage> appRoutes = [
  /// HOME
  GetPage(
    name: AppLink.intro,
    page: () => GeneralLayout(content: IntroScreen(saveIntroStatus: () {})),
  ),
  GetPage(
    name: AppLink.home,
    page: () => const StartScreen(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: AppLink.promo,
    page: () => const HomeLayout(content: PromoScreen()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: AppLink.scanqr,
    page: () => const GeneralLayout(content: ScanQr()),
  ),
  GetPage(
    name: AppLink.notification,
    page: () => HomeLayout(content: NotificationScreen()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: AppLink.profile,
    page: () => const HomeLayout(content: ProfileScreen()),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: pageTransitionDuration)
  ),
  GetPage(
    name: AppLink.notFound,
    page: () => const DefaultLayout(title: 'Not Found', content: NotFound()),
  ),
];