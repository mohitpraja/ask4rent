import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/feature/splash/splash_bind.dart';
import 'package:ask4rent/feature/splash/splash_view.dart';
import 'package:get/get.dart';

List<GetPage> allpages = [
  GetPage(
      name: Routes.splash, 
      page: () => const SplashView(), 
      binding: SplashBinding()
      ),
];
