import 'package:app/features/data/mapper/auth_api_mapper.dart';
import 'package:app/features/data/model/auth_api_model.dart';
import 'package:app/features/domain/entity/auth_api_entity.dart';
import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Fauiler, AuthEntity>> signIn(
      String login, String password) async {
    try {
      final data = await service<Dio>().get('cars');

      return right(AuthModel.fromJson(data.data).toEntity());
    } on DioException catch (_) {
      print("\n\n\n\n" + (_.message ?? "") + "\n\n\n\n");
      return left(DioException_());
    }
  }
}
