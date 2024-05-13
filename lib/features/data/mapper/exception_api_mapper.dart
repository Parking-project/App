import 'package:app/features/data/model/exception_api_model.dart';
import 'package:app/features/domain/entity/exception_api_entity.dart';

extension ExceptionMapperModel on ExceptionModel {
  ExceptionEntity toEntity() {
    return ExceptionEntity(
      message: message,
    );
  }
}
