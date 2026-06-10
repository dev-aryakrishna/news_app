import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> signUp({required String email,  required String password});
  Future<UserEntity> login({required String email,  required String password});
  Future<void> logout();
  bool get isLoggedIn;
}