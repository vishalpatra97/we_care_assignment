import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/config/app_constant.dart';
import 'package:we_care/core/services/supabase/supabase_service.dart';

class SupabaseAuthDataSource {
  final SupabaseService supabaseService;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  SupabaseAuthDataSource(this.supabaseService);

  SupabaseClient get _client => supabaseService.client;

  // Email

  Future<User> signUpWithEmail(
    String email,
    String password,
    String phone,
  ) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      phone: phone,
    );
    return response.user!;
  }

  Future<User> signInWithEmail(String email, String password) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user!;
  }

  // Google

  Future<User> signInWithGoogle() async {
    try {
      //
      await _googleSignIn.initialize(
        serverClientId: AppConstants.webClientId,
        clientId: AppConstants.androidClientId,
      );

      //
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();
      if (googleUser == null) throw Exception('Google sign in cancelled');

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      if (googleAuth.idToken == null) {
        throw Exception('No ID Token received from Google');
      }

      final authorization =
          await googleUser.authorizationClient.authorizationForScopes([
            'email',
            'profile',
          ]) ??
          await googleUser.authorizationClient.authorizeScopes([
            'email',
            'profile',
          ]);

      final response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken ?? "",
        accessToken: authorization.accessToken,
      );

      return _client.auth.currentUser!;
    } on GoogleSignInException catch (e) {
      print('Code: ${e.code}, Message: ${e.description}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // Apple

  Future<User> signInWithApple() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.apple,
      redirectTo: 'io.supabase.flutter://callback',
    );
    return _client.auth.currentUser!;
  }
}
