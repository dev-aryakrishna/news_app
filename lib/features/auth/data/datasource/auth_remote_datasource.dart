import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signUp({required String email, required String password, required String fullname, required String phone});
  Future<AuthResponse> login({required String email, required String password});
  Future<void> logout();
  Session? getCurrentSession();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<AuthResponse> signUp({
    required String fullname,
    required String phone,
    required String email, 
    required String password
    }) async {
      print("data source signup called");
    final response = await supabase.auth.signUp(
      
      email: email, 
      password: password,
      data: {
      'full_name': fullname,
      'phone':phone,
      }
      );
      print("data source signup success");
       return response;
      
   
  }

  @override
  Future<AuthResponse> login({required String email, required String password}) async {
    return await supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  @override
  Session? getCurrentSession() {
    return supabase.auth.currentSession;
  }
}