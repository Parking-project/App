import 'package:app/features/domain/entity/message_api_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/domain/entity/reserve_api_entity.dart';

abstract class ReserveRepository {
  Future<Either<Fauiler, List<ReserveEntity>>> getPage(
    List<int> state,
    int pageIndex,
    int pageSize
  );
  Future<Either<Fauiler, MessageEntity>> deleteReserve(
    String reserveID
  );
  Future<Either<Fauiler, MessageEntity>> addReserve(
    int begin,
    int end
  );
}
