class MessageEntity{
  final String ID;
  final int messageDate;
  final String messageText;
  final int messageTelegramID;

  MessageEntity({
    required this.ID,
    required this.messageDate,
    required this.messageText,
    required this.messageTelegramID,
  });
}