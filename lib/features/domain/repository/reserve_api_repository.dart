import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/domain/entity/reserve_api_entity.dart';

abstract class ReserveRepository {
  Future<Either<Fauiler, List<ReserveEntity>>> writeCar(
    int limit,
    String model,
  );
}
