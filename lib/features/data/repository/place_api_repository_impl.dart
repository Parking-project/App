import 'package:app/features/data/mapper/place_api_mapper.dart';
import 'package:app/features/data/model/place_api_entity.dart';
import 'package:app/features/domain/entity/place_api_entity.dart';
import 'package:app/features/domain/repository/place_api_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/di/service.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  @override
  Future<Either<Fauiler, List<PlaceEntity>>> writeCar(
    int limit,
    String model,
  ) async {
    try {
      final data =
          await service<Dio>().get('cars?limit=${limit}&model=${model}');

      return right((data.data as List)
          .map((json) => PlaceModel.fromJson(json).toEntity())
          .toList());
    } on DioException catch (_) {
      print("\n\n\n\n" + (_.message ?? "") + "\n\n\n\n");
      return left(DioException_());
    }
  }
}
