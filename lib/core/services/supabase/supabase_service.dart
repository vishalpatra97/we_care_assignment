import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static SupabaseService? _instance;
  static SupabaseClient? _client;

  SupabaseService._();

  static Future<SupabaseService> initialize({
    required String url,
    required String publishableKey,
  }) async {
    if (_instance == null) {
      await Supabase.initialize(url: url, publishableKey: publishableKey);
      _client = Supabase.instance.client;
      _instance = SupabaseService._();
    }
    return _instance!;
  }

  SupabaseClient get client => _client!;

  // Database shortcuts
  SupabaseQueryBuilder from(String table) => client.from(table);

  Future<void> signOut() => client.auth.signOut();

  Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;
}
