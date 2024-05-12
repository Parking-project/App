class ExceptionData {
  final String message;

  ExceptionData.fromApi(Map<String, dynamic> map)
      : message = map['message'];
}
