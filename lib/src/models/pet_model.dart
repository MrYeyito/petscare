import 'dart:convert';

PetModel petModelFromJson(String str) => PetModel.fromJson(json.decode(str));

String petModelToJson(PetModel data) => json.encode(data.toJson());

class PetModel {
    PetModel({
        this.nombre,
        this.tipo,
        this.raza,
        this.sexo,
        this.edad,
    });

    String nombre;
    String tipo;
    String raza;
    String sexo;
    int edad;

    factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        nombre: json["nombre"],
        tipo: json["tipo"],
        raza: json["raza"],
        sexo: json["sexo"],
        edad: json["edad"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "tipo": tipo,
        "raza": raza,
        "sexo": sexo,
        "edad": edad,
    };
}
