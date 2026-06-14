import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  final bool isNewUser;

  AuthSuccess(this.user, {this.isNewUser = false});

  @override
  List<Object?> get props => [user, isNewUser];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Optional: For global auth listening
class AuthUnauthenticated extends AuthState {}
