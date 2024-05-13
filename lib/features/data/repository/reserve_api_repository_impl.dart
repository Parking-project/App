import 'dart:convert';

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
      List<int> state, int pageIndex) async {
    try {
      final data = await service<Dio>().post(
        '${_baseUrl}/get_state',
        data: jsonEncode({
          "reserve_states": state,
          "page_index": pageIndex,
          "page_size": 10,
        }),
      );
      print("\n\n\nStatus_code = ${data}");
      return right((data.data["data"] as List)
          .map((json) => ReserveModel.fromJson(json).toEntity())
          .toList());
    } on DioException catch (_) {
      return left(DioException_());
    }
  }
}
