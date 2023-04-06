part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// Mostrar splash
class AuthInitial extends AuthState {}

// Mostrar Home page
class AuthSuccessState extends AuthState {}

// Cerrar sesión
class SignOutSuccessState extends AuthState {}

// Mostrar un error
class AuthErrorState extends AuthState {}

// Para mostrar carga
class AuthLoadingState extends AuthState {}

// Mostrar el login
class UnAuthState extends AuthState {}
