
import 'package:app/features/data/model/place_api_entity.dart';
import 'package:app/features/domain/entity/place_api_entity.dart';

extension PlaceMapperModel on PlaceModel {
  PlaceEntity toEntity() {
    return PlaceEntity(
      ID: ID,
      placeCode: placeCode,
    );
  }
}