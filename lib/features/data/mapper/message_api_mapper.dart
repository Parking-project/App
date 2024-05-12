import 'package:app/features/data/model/message_api_model.dart';
import 'package:app/features/domain/entity/message_api_entity.dart';

extension MessageMapperModel on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
      ID: ID,
      messageDate: messageDate,
      messageText: messageText,
      messageTelegramID: messageTelegramID,
    );
  }
}
