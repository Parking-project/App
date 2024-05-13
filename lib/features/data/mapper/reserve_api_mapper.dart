import 'package:app/features/data/model/reserve_api_model.dart';
import 'package:app/features/domain/entity/reserve_api_entity.dart';

extension ReserveMapperModel on ReserveModel {
  ReserveEntity toEntity() {
    return ReserveEntity(
      ID: ID,
      begin: begin,
      end: end,
      state: state,
      place_code: place_code
    );
  }
}
