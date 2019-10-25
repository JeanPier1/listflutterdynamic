
class Tipo{
  String nombreTipo;

  Tipo({
  this.nombreTipo,
  });

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
    nombreTipo: json["nomTipo"],
  );

  Map<String, dynamic> toJson() => {
    "nombreTipo": nombreTipo,
  };
}