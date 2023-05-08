// To parse this JSON data, do
//
//     final carModel = carModelFromMap(jsonString);

import 'dart:convert';

class CarModel {
  CarModel({
    required this.arabaAdi,
    required this.ulke,
    required this.kurulus,
    required this.model,
  });

  final String arabaAdi;
  final String ulke;
  final int kurulus;
  final List<Model> model;

  CarModel copyWith({
    String? arabaAdi,
    String? ulke,
    int? kurulus,
    List<Model>? model,
  }) =>
      CarModel(
        arabaAdi: arabaAdi ?? this.arabaAdi,
        ulke: ulke ?? this.ulke,
        kurulus: kurulus ?? this.kurulus,
        model: model ?? this.model,
      );

  factory CarModel.fromJson(String str) => CarModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarModel.fromMap(Map<String, dynamic> json) => CarModel(
        arabaAdi: json["araba_adi"],
        ulke: json["ulke"],
        kurulus: json["kurulus"],
        model: List<Model>.from(json["model"].map((x) => Model.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "araba_adi": arabaAdi,
        "ulke": ulke,
        "kurulus": kurulus,
        "model": List<dynamic>.from(model.map((x) => x.toMap())),
      };
}

class Model {
  Model({
    required this.modelAdi,
    required this.fiyat,
    required this.benzinli,
  });

  final String modelAdi;
  final int fiyat;
  final bool benzinli;

  Model copyWith({
    String? modelAdi,
    int? fiyat,
    bool? benzinli,
  }) =>
      Model(
        modelAdi: modelAdi ?? this.modelAdi,
        fiyat: fiyat ?? this.fiyat,
        benzinli: benzinli ?? this.benzinli,
      );

  factory Model.fromJson(String str) => Model.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Model.fromMap(Map<String, dynamic> json) => Model(
        modelAdi: json["model_adi"],
        fiyat: json["fiyat"],
        benzinli: json["benzinli"],
      );

  Map<String, dynamic> toMap() => {
        "model_adi": modelAdi,
        "fiyat": fiyat,
        "benzinli": benzinli,
      };
}
