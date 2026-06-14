import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/services/supabase/supabase_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/supabase_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuthDataSource dataSource;
  final SupabaseService supabaseService;

  AuthRepositoryImpl(this.dataSource, this.supabaseService);

  @override
  Future<UserEntity> signUpWithEmail(
    String email,
    String password,
    String phone,
  ) async {
    try {
      final user = await dataSource.signUpWithEmail(email, password, phone);
      await _handleFirstTimeProfile(user);
      return _mapToEntity(user, isNewUser: true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    try {
      final user = await dataSource.signInWithEmail(email, password);
      await _handleFirstTimeProfile(user);
      return _mapToEntity(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    try {
      final user = await dataSource.signInWithGoogle();
      final isNewUser = await _isFirstTimeUser(user.id);
      if (isNewUser) await _handleFirstTimeProfile(user);
      return _mapToEntity(user, isNewUser: isNewUser);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signInWithApple() async {
    try {
      final user = await dataSource.signInWithApple();
      final isNewUser = await _isFirstTimeUser(user.id);
      if (isNewUser) await _handleFirstTimeProfile(user);
      return _mapToEntity(user, isNewUser: isNewUser);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _handleFirstTimeProfile(User user) async {
    final existing = await supabaseService
        .from('profiles')
        .select('id')
        .eq('id', user.id)
        .maybeSingle();

    if (existing == null) {
      final fullName =
          user.userMetadata?['full_name'] ??
          user.userMetadata?['name'] ??
          '${user.userMetadata?['given_name'] ?? ''} ${user.userMetadata?['family_name'] ?? ''}'
              .trim();

      await supabaseService.from('profiles').upsert({
        'id': user.id,
        'email': user.email,
        'full_name': fullName.isNotEmpty ? fullName : null,
        'avatar_url':
            user.userMetadata?['avatar_url'] ?? user.userMetadata?['picture'],
        'updated_at': DateTime.now().toIso8601String(),
      });
    }
  }

  Future<bool> _isFirstTimeUser(String userId) async {
    final profile = await supabaseService
        .from('profiles')
        .select('id')
        .eq('id', userId)
        .maybeSingle();
    return profile == null;
  }

  UserEntity _mapToEntity(User user, {bool isNewUser = false}) {
    return UserEntity(
      id: user.id,
      email: user.email,
      fullName: user.userMetadata?['full_name'] ?? user.userMetadata?['name'],
      avatarUrl:
          user.userMetadata?['avatar_url'] ?? user.userMetadata?['picture'],
      isNewUser: isNewUser,
    );
  }

  @override
  Future<void> signOut() => supabaseService.signOut();

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = supabaseService.client.auth.currentUser;
    return user != null ? _mapToEntity(user) : null;
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return supabaseService.authStateChanges.map((data) {
      final user = data.session?.user;
      return user != null ? _mapToEntity(user) : null;
    });
  }
}
