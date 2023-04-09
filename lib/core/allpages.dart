import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/feature/dashboard/binding/dashboard_binding.dart';
import 'package:ask4rent/feature/dashboard/view/dashboard_veiw.dart';
import 'package:ask4rent/feature/editprofile/binding/editprofile_binding.dart';
import 'package:ask4rent/feature/editprofile/view/editprofile_view.dart';
import 'package:ask4rent/feature/forgot/binding/forgot_binding.dart';
import 'package:ask4rent/feature/forgot/view/forgot_view.dart';
import 'package:ask4rent/feature/forgotpass/binding/forgotpass_binding.dart';
import 'package:ask4rent/feature/forgotpass/view/forgotpass_view.dart';
import 'package:ask4rent/feature/login/binding/login_bind.dart';
import 'package:ask4rent/feature/login/view/login_view.dart';
import 'package:ask4rent/feature/otp/binding/otp_binding.dart';
import 'package:ask4rent/feature/otp/view/otp_view.dart';
import 'package:ask4rent/feature/ownerSeeker/binding/owner_seeker_binding.dart';
import 'package:ask4rent/feature/ownerSeeker/view/owner_seeker_view.dart';
import 'package:ask4rent/feature/property/binding/property_binding.dart';
import 'package:ask4rent/feature/property/view/property_page.dart';
import 'package:ask4rent/feature/propertyDetail/binding/property_detail_binding.dart';
import 'package:ask4rent/feature/propertyDetail/view/property_detail_view.dart';
import 'package:ask4rent/feature/savedProperty/binding/saved_property_binding.dart';
import 'package:ask4rent/feature/savedProperty/view/saved_property_view.dart';
import 'package:ask4rent/feature/signup/binding/signup_binding.dart';
import 'package:ask4rent/feature/signup/view/signup_view.dart';
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
  GetPage(
      name: Routes.signup,
      page: () => const SignupView(),
      binding: SignupBinding()),
  GetPage(
      name: Routes.otp,
      page: () => const OtpView(),
      binding: OtpBinding()),
  GetPage(
      name: Routes.forgot,
      page: () => const ForgotView(),
      binding: ForgotBinding()),
  GetPage(
      name: Routes.property,
      page: () => const PropertyPage(),
      binding: PropertyBinding()),
  GetPage(
      name: Routes.ownerSeeker,
      page: () => const OwnerSeekerView(),
      binding: OwnerSeekerBinding()),
  GetPage(
      name: Routes.editProfile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding()),
  GetPage(
      name: Routes.forgotPass,
      page: () => const ForgotPassView(),
      binding: ForgotPassBinding()),
  GetPage(
      name: Routes.propertyDetail,
      page: () => const PropertyDetailView(),
      binding: PropertyDetailBinding()),
  GetPage(
      name: Routes.savedProperty,
      page: () => const SavedPropertyView(),
      binding: SavedPropertyBinding()),
];


