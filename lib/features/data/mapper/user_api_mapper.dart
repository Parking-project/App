import 'package:app/features/data/model/user_api_model.dart';
import 'package:app/features/domain/entity/user_api_entity.dart';

extension UserMapperModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      login: login,
      displayName: displayName,
    );
  }
}
