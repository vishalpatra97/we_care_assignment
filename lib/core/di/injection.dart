import 'package:get_it/get_it.dart';
import 'package:we_care/core/config/app_constant.dart';
import 'package:we_care/core/network/dio_client.dart';
import 'package:we_care/core/services/supabase/supabase_service.dart';
import 'package:we_care/features/auth/data/datasources/supabase_auth_datasource.dart';
import 'package:we_care/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:we_care/features/auth/domain/repositories/auth_repository.dart';
import 'package:we_care/features/auth/domain/usecases/get_current_user.dart';
import 'package:we_care/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:we_care/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:we_care/features/auth/domain/usecases/sign_out.dart';
import 'package:we_care/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:we_care/features/auth/presentation/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Core
  final supabaseService = await SupabaseService.initialize(
    url: AppConstants.supabaseUrl,
    publishableKey: AppConstants.supabasePublishableKey,
  );
  getIt.registerSingleton<SupabaseService>(supabaseService);
  //
  getIt.registerSingleton<DioClient>(DioClient());

  // Auth Feature
  getIt.registerLazySingleton<SupabaseAuthDataSource>(
    () => SupabaseAuthDataSource(getIt<SupabaseService>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<SupabaseAuthDataSource>(),
      getIt<SupabaseService>(),
    ),
  );
  // UseCases
  getIt.registerLazySingleton(
    () => SignUpWithEmailUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(
    () => SignInWithEmailUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(
    () => SignInWithGoogleUseCase(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(() => SignOutUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
    () => GetCurrentUserUseCase(getIt<AuthRepository>()),
  );
  //AuthCubit
  getIt.registerSingleton<AuthCubit>(
    AuthCubit(
      signUpWithEmailUseCase: getIt<SignUpWithEmailUseCase>(),
      signInWithEmailUseCase: getIt<SignInWithEmailUseCase>(),
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
      signOutUseCase: getIt<SignOutUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
    ),
  );
}
