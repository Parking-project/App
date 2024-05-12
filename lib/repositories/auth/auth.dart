class AuthData {
  final String access;
  final String refresh;
  final String role;

  AuthData.fromApi(Map<String, dynamic> map)
      : access = map['tokens']['access'],
        refresh = map['tokens']['refresh'],
        role = map['role']['solar_noon'];
}
