import 'package:app/features/data/model/auth_api_model.dart';
import 'package:app/features/domain/entity/auth_api_entity.dart';

extension AuthMapperModel on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(
      access: access,
      refresh: refresh,
      roleName: roleName,
    );
  }
}
