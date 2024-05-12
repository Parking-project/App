class MessageData {
  final String message;

  MessageData.fromApi(Map<String, dynamic> map)
      : message = map['data'];
}
