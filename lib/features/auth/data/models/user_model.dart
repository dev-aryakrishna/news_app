import 'package:news_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
    UserModel({
    required super.id,
    required super.email,
  }) ;

  factory UserModel.fromSupabaseUser(String id, String email) {
    return UserModel(
      id: id,
      email: email,
    );
  }

}
