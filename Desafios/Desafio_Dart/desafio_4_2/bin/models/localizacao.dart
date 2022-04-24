import 'dart:convert';

class Localizacao {
  String latitude;
  String longitude;
  Localizacao({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() =>
      {'latidude': latitude, 'longitude': longitude};

  factory Localizacao.fromMap(Map<String, dynamic> map) =>
      Localizacao(latitude: map['lat'] ?? '', longitude: map['lng']?? '');

  String toJson() => jsonEncode(toMap());

  factory Localizacao.fromJson(String json) =>
      Localizacao.fromMap(jsonDecode(json));

  @override
  String toString() => 'Localizacao(latitude: $latitude, longitude: $longitude)';
}
