class ExceptionModel {
  final String message;

  ExceptionModel({
    required this.message,
  });

  factory ExceptionModel.fromJson(Map<String, dynamic> json) {
    return ExceptionModel(
      message: json['message'],
    );
  }
}
