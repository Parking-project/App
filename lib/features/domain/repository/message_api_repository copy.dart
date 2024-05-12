import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/domain/entity/message_api_entity.dart';

abstract class MessageRepository {
  Future<Either<Fauiler, List<MessageEntity>>> signIn();
}
