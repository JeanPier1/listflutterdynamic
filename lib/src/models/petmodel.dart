import 'dart:convert';
import 'historymodel.dart';

PetModel petModelFromJson(String str) => PetModel.fromJson(json.decode(str));

String petModelToJson(PetModel data) => json.encode(data.toJson());

class PetModel {
  String id;
  String name;
  String birthday;
  String owner;
  String breed;
  String weight;
  String height;
  String imagePath;
  List<History> history;

  PetModel({
    this.id,
    this.name,
    this.birthday,
    this.owner,
    this.breed,
    this.weight,
    this.height,
    this.imagePath,
    this.history,
    });

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
    id: json["id"],
    name: json["name"],
    birthday: json["birthday"],
    owner: json["owner"],
    breed: json["breed"],
    weight: json["weight"],
    height: json["height"],
    imagePath: json["imagePath"],
    history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthday": birthday,
    "owner": owner,
    "breed": breed,
    "weight": weight,
    "height": height,
    "imagePath": imagePath,
    "history": List<dynamic>.from(history.map((x) => x.toJson())),
  };
}
