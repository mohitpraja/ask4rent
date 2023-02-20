import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/feature/dashboard/binding/dashboard_binding.dart';
import 'package:ask4rent/feature/dashboard/view/dashboard_veiw.dart';
import 'package:ask4rent/feature/login/binding/login_bind.dart';
import 'package:ask4rent/feature/login/view/login_view.dart';
import 'package:ask4rent/feature/splash/binding/splash_bind.dart';
import 'package:ask4rent/feature/splash/view/splash_view.dart';
import 'package:get/get.dart';

List<GetPage> allpages = [
  GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding()),
  GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding()),
  GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding()),
];
