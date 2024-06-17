import 'package:app/features/data/mapper/auth_api_mapper.dart';
import 'package:app/features/data/model/auth_api_model.dart';
import 'package:app/features/domain/entity/auth_api_entity.dart';
import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';
import 'dart:convert';

class AuthRepositoryImpl implements AuthRepository {
  final String _baseUrl = "/token";
  @override
  Future<Either<Fauiler, AuthEntity>> signIn(
      String login, String password) async {
    try {
      final data = await service<Dio>().post(
        "$_baseUrl/login",
        data: jsonEncode({"login": login, "password": password}),
      );

      return right(AuthModel.fromJson(data.data).toEntity());
    } on DioException catch (_) {
      return left(DioExceptionCustom());
    }
  }

  @override
  Future<Either<Fauiler, AuthEntity>> registration(
      String login, String displayName, String password) async {
    try {
      final data = await service<Dio>().post(
        "$_baseUrl/register",
        data: jsonEncode({"login": login, "password": password, "display_name": displayName}),
      );
      return right(AuthModel.fromJson(data.data).toEntity());
    } on DioException catch (_) {
      return left(DioExceptionCustom());
    }
  }
}
