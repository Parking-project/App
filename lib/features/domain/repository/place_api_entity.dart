import 'package:app/features/domain/entity/place_api_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';

abstract class PlaceRepository {
  Future<Either<Fauiler, List<PlaceEntity>>> writeCar(
    int limit,
    String model,
  );
}
