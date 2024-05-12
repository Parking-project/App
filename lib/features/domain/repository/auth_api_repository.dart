import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/domain/entity/auth_api_entity.dart';

abstract class AuthRepository {
  Future<Either<Fauiler, AuthEntity>> signIn(
    String login,
    String password
  );
  Future<Either<Fauiler, AuthEntity>> registration(
    String login,
    String displayName,
    String password
  );
}
