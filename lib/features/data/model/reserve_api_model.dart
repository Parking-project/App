class ReserveModel {
  final String ID;
  final int begin;
  final int end;
  final String state;
  final String place_code;

  ReserveModel({
    required this.ID,
    required this.begin,
    required this.end,
    required this.state,
    required this.place_code,
  });

  factory ReserveModel.fromJson(Map<String, dynamic> json) {
    String place_code = "--------";
    if (json.containsKey("place_code"))
      place_code = json["place_code"];
    
    String state = "";
    switch(json['reserve_state']){
      case 1:
        state = "Удалена";
      case 2:
        state = "Отправлена";
      case 3:
        state = "Одобрена";
      case _:
      state = "Удалена";
    }
    return ReserveModel(
      ID: json['ID'],
      begin: json['reserve_begin'],
      end: json['reserve_end'],
      state: state,
      place_code: place_code,
    );
  }
}
