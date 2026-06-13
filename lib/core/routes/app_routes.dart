import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: Routes.allRoutes,
    redirect: (context, state) {
      // Implement any global redirection logic here if needed
      return null; // No redirection by default
    },
  );
}
