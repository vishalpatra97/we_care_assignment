import 'package:go_router/go_router.dart';
import 'package:we_care/features/auth/presentation/pages/login_page.dart';
import 'package:we_care/features/auth/presentation/pages/signup_page.dart';
import 'package:we_care/features/home/presentation/pages/dashboard_page.dart';
import 'package:we_care/features/home/presentation/pages/find_doctors_page.dart';
import 'package:we_care/features/splash/splash_page.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = 'signup';
  static const String dashboard = 'dashboard';
  static const String findDoctors = 'find-doctors';

  static final List<GoRoute> allRoutes = [
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(path: login, builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/$signup',
      name: signup,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/$dashboard',
      name: dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/$findDoctors',
      name: findDoctors,
      builder: (context, state) => const FindDoctorsPage(),
    ),
  ];
}
