class AuthModel {
  final String access;
  final String refresh;
  final String roleName;

  AuthModel({
    required this.access,
    required this.refresh,
    required this.roleName,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      access: json['tokens']['access'],
      refresh: json['tokens']['refresh'],
      roleName: json['role'],
    );
  }
}
