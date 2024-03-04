import 'models/models.dart';

abstract class UserRepository {
  Stream<MyUser?> get user;

  Future<MyUser> signup(MyUser mUser, String password);

  Future<void> setUSerData(MyUser user);

  Future<void> signIn(String email, String password);

  Future<void> logout();
}
