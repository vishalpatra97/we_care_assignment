import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/app/cubit/app_roll_cubit.dart';
import 'package:we_care/core/bootstrap/app_initializer.dart';
import 'package:we_care/core/di/injection.dart';
import 'package:we_care/core/routes/app_routes.dart';
import 'package:we_care/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  await AppInitializer.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppRoleCubit()),
        BlocProvider(create: (_) => getIt<AuthCubit>(), lazy: false),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
