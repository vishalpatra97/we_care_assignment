import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  SupabaseService();

  User? get currentUser => client.auth.currentUser;
  Session? get currentSession => client.auth.currentSession;

  //OAuth
  Future<bool> signInWithGoogle() async {
    return await client.auth.signInWithOAuth(OAuthProvider.google);
  }

  Future<bool> signInWithApple() async {
    return await client.auth.signInWithOAuth(OAuthProvider.apple);
  }

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;
}
