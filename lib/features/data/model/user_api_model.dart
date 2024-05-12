class UserModel {
  final String login;
  final String displayName;

  UserModel({
    required this.login,
    required this.displayName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      displayName: json['display_name'],
    );
  }
}
