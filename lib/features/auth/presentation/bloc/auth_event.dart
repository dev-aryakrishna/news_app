import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}
class SignUpRequested extends AuthEvent {
  final String fullname;
  final String phone;
  final String email;
  final String password;

  const SignUpRequested({
    required this.fullname, 
    required this.phone , 
    required this.email, 
    required this.password});

  @override
  List<Object?> get props => [
    fullname,
    phone,
    email, 
    password,
  ];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
  
}

class LogoutRequested extends AuthEvent {}
class CheckSessionRequested extends AuthEvent {}

