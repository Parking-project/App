import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/domain/entity/user_api_entity.dart';

abstract class UserRepository {
  Future<Either<Fauiler, UserEntity>> getUser();
}
