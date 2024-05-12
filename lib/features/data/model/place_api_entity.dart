class PlaceModel{
  final String ID;
  final String placeCode;

  PlaceModel({
    required this.ID,
    required this.placeCode,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      ID: json['ID'],
      placeCode: json['place_code'],
    );
  }
}