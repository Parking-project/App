import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';
import 'package:app/features/domain/entity/user_api_entity.dart';
import 'package:app/features/domain/repository/user_api_repository.dart';

import 'package:app/features/data/mapper/user_api_mapper.dart';
import '../model/user_api_model.dart';

class UserRepositoryImpl implements UserRepository {
  final String baseUrl = "/user"; 

  @override
  Future<Either<Fauiler, UserEntity>> getUser() async {
    try {
      final data =
          await service<Dio>().get("$baseUrl/get");

      return right(
        UserModel.fromJson(data.data).toEntity()
      );

    } on DioException catch (_) {
      return left(DioExceptionCustom());
    }
  }
}
