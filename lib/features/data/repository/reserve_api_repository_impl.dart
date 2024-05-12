import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';
import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';

import 'package:app/features/data/mapper/reserve_api_mapper.dart';
import '../model/reserve_api_model.dart';

class ReserveRepositoryImpl implements ReserveRepository {
  @override
  Future<Either<Fauiler, List<ReserveEntity>>> writeCar(
    int limit,
    String model,
  ) async {
    try {
      final data =
          await service<Dio>().get('cars?limit=${limit}&model=${model}');

      return right((data.data as List)
          .map((json) => ReserveModel.fromJson(json).toEntity())
          .toList());
    } on DioException catch (_) {
      print("\n\n\n\n" + (_.message ?? "") + "\n\n\n\n");
      return left(DioException_());
    }
  }
}
