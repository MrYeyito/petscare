import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.edad,
    this.email,
    this.nombre,
  });

  int edad;
  String email;
  String nombre;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        edad: json["edad"],
        email: json["email"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "edad": edad,
        "email": email,
        "nombre": nombre,
      };
}
