import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckSessionRequested>(_onCheckSessionRequested);
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    print("signup event recieved");
    emit(AuthLoading());
    try {
      await authRepository.signUp(
        fullname: event.fullname,
        phone: event.phone,
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated());
    } catch (e) {
      print("Signup error $e");
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    print("Login Recieved");
    emit(AuthLoading());
    try {
      await authRepository.login(email: event.email, password: event.password);
      emit(AuthAuthenticated());
    } catch (e) {
      print("Login error $e");
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepository.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onCheckSessionRequested(
    CheckSessionRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      if (authRepository.isLoggedIn) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
