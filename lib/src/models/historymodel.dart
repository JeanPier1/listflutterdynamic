import 'package:disenos/src/models/tipomodel.dart';

class History {
  String descrpcion;
  List<Tipo> tipo;
  String fecha;
  String titulo;

  History({
    this.descrpcion,
    this.tipo,
    this.fecha,
    this.titulo,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    descrpcion: json["Descricion"],
    tipo: List<Tipo>.from(json["Tipo"].map((x) => Tipo.fromJson(x))),
    fecha: json["fecha"],
    titulo: json["titulo"],
  );

  Map<String, dynamic> toJson() => {
    "Descrpcion": descrpcion,
    "Tipo": List<dynamic>.from(tipo.map((x) => x.toJson())),
    "fecha": fecha,
    "Titulo": titulo,
  };
}