class MyUserEntity {
  final String userId;
  final String email;
  final String name;
  final bool hasActiveCart;

  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  Map<String, Object?> toJSON() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  static MyUserEntity fromJSON(Map<String, dynamic> data) {
    return MyUserEntity(
      userId: data['userId'],
      email: data['email'],
      name: data['name'],
      hasActiveCart: data['hasActiveCart'],
    );
  }
}
