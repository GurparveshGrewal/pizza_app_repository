import 'package:user_repository/src/entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    hasActiveCart: false,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity myUserEntity) {
    return MyUser(
      userId: myUserEntity.userId,
      email: myUserEntity.email,
      name: myUserEntity.name,
      hasActiveCart: myUserEntity.hasActiveCart,
    );
  }
}
