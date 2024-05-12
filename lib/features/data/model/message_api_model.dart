class MessageModel {
  final String ID;
  final int messageDate;
  final String messageText;
  final int messageTelegramID;

  MessageModel({
    required this.ID,
    required this.messageDate,
    required this.messageText,
    required this.messageTelegramID,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      ID: json['ID'],
      messageDate: json['message_date'],
      messageText: json['message_text'],
      messageTelegramID: json['message_bot_id'],
    );
  }
}
