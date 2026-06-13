import 'package:flutter/material.dart';
import 'package:we_care/core/bootstrap/app_initializer.dart';
import 'package:we_care/core/routes/app_routes.dart';

void main() async {
  await AppInitializer.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WeCare App',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        // Global error boundary / observer
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
