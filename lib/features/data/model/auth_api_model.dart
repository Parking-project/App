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
      access: json['access'],
      refresh: json['refresh'],
      roleName: json['role_name'],
    );
  }
}
