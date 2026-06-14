import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/di/injection.dart';
import 'package:we_care/core/services/supabase/supabase_service.dart';
import 'package:we_care/features/auth/domain/usecases/get_current_user.dart';
import 'package:we_care/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:we_care/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:we_care/features/auth/domain/usecases/sign_out.dart';
import 'package:we_care/features/auth/domain/usecases/sign_up_with_email.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpWithEmailUseCase signUpWithEmailUseCase;
  final SignInWithEmailUseCase signInWithEmailUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  StreamSubscription? _authSubscription;

  AuthCubit({
    required this.signUpWithEmailUseCase,
    required this.signInWithEmailUseCase,
    required this.signInWithGoogleUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AuthInitial()) {
    _listenToAuthChanges();
  }

  // EMail Auth

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());
    try {
      final user = await signUpWithEmailUseCase.call(
        email: email,
        password: password,
        phone: phone,
      );
      emit(AuthSuccess(user, isNewUser: true));
    } catch (e) {
      emit(AuthFailure(_mapError(e)));
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await signInWithEmailUseCase.call(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(_mapError(e)));
    }
  }

  // OAuth

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await signInWithGoogleUseCase.call();
      emit(AuthSuccess(user, isNewUser: user.isNewUser));
    } catch (e) {
      emit(AuthFailure(_mapError(e)));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await signOutUseCase.call();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthFailure(_mapError(e)));
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await getCurrentUserUseCase.call();
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthFailure(_mapError(e)));
    }
  }

  void _listenToAuthChanges() {
    _authSubscription = getIt<SupabaseService>().authStateChanges.listen((
      data,
    ) {
      final user = data.session?.user;
      if (user != null) {
        // You can optionally sync with repository mapping
        getCurrentUser();
      } else {
        emit(AuthUnauthenticated());
      }
    });
  }

  String _mapError(dynamic error) {
    if (error.toString().contains('Email already registered')) {
      return 'This email is already registered. Please sign in.';
    } else if (error.toString().contains('Invalid login credentials')) {
      return 'Invalid email or password.';
    } else if (error.toString().contains('User already registered')) {
      return 'User already exists. Try signing in.';
    }
    return error.toString();
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
