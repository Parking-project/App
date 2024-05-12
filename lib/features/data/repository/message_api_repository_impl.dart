import 'package:app/features/data/mapper/message_api_mapper.dart';
import 'package:app/features/data/model/message_api_model.dart';
import 'package:app/features/domain/entity/message_api_entity.dart';
import 'package:app/features/domain/repository/message_api_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';

class MessageRepositoryImpl implements MessageRepository {
  @override
  Future<Either<Fauiler, List<MessageEntity>>> signIn() async {
    try {
      final data = await service<Dio>().get('cars');

      return right((data.data as List)
          .map((json) => MessageModel.fromJson(json).toEntity())
          .toList());
      // return right(AuthModel.fromJson(data.data).toEntity());
    } on DioException catch (_) {
      print("\n\n\n\n" + (_.message ?? "") + "\n\n\n\n");
      return left(DioException_());
    }
  }
}
