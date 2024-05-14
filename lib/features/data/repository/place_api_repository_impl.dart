import 'dart:convert';

import 'package:app/features/data/mapper/place_api_mapper.dart';
import 'package:app/features/data/model/place_api_entity.dart';
import 'package:app/features/domain/entity/place_api_entity.dart';
import 'package:app/features/domain/repository/place_api_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final String _baseUrl = "/reserve";
  @override
  Future<Either<Fauiler, List<PlaceEntity>>> getPage(
    String reserveID,
    int pageIndex,
    int pageSize,
  ) async {
    try {
      final data = await service<Dio>().post(
        '$_baseUrl/get_free_id',
        data: jsonEncode({
          "reserve_id": reserveID,
          "page_index": pageIndex,
          "page_size": pageSize,
        }),
      );

      return right((data.data as List)
          .map((json) => PlaceModel.fromJson(json).toEntity())
          .toList());
    } on DioException catch (_) {
      return left(DioExceptionCustom());
    }
  }
}
