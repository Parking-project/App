class ReserveModel {
  final String ID;
  final int begin;
  final int end;
  final String place_code;

  ReserveModel({
    required this.ID,
    required this.begin,
    required this.end,
    required this.place_code,
  });

  factory ReserveModel.fromJson(Map<String, dynamic> json) {
    return ReserveModel(
      ID: json['ID'],
      begin: json['begin'],
      end: json['end'],
      place_code: json['place_code'],
    );
  }
}
