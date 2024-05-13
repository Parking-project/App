import 'dart:convert';

import 'package:app/features/data/mapper/message_api_mapper.dart';
import 'package:app/features/data/model/message_api_model.dart';
import 'package:app/features/domain/entity/message_api_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';
import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';

import 'package:app/features/data/mapper/reserve_api_mapper.dart';
import '../model/reserve_api_model.dart';

class ReserveRepositoryImpl implements ReserveRepository {
  final String _baseUrl = "/reserve";
  @override
  Future<Either<Fauiler, List<ReserveEntity>>> getPage(
      List<int> state, int pageIndex, int pageSize) async {
    try {
      final data = await service<Dio>().post(
        '${_baseUrl}/get_state',
        data: jsonEncode({
          "reserve_states": state,
          "page_index": pageIndex,
          "page_size": pageSize,
        }),
      );
      return right((data.data["data"] as List)
          .map((json) => ReserveModel.fromJson(json).toEntity())
          .toList());
    } on DioException catch (_) {
      return left(DioException_());
    }
  }
  
  @override
  Future<Either<Fauiler, MessageEntity>> deleteReserve(String reserveID) async{
    try {
      final data = await service<Dio>().post(
        '${_baseUrl}/delete',
        data: jsonEncode({
          "reserve_id": reserveID,
        }),
      );
      return right(MessageModel.fromJson(data.data).toEntity());
    } on DioException catch (_) {
      return left(DioException_());
    }
  }
  
  @override
  Future<Either<Fauiler, MessageEntity>> addReserve(int begin, int end) async{
    try {
      final data = await service<Dio>().post(
        '${_baseUrl}/post_dates',
        data: jsonEncode({
          "begin": begin,
          "end": end,
        }),
      );
      return right(MessageModel.fromJson(data.data).toEntity());
    } on DioException catch (_) {
      return left(DioException_());
    }
  }
}
