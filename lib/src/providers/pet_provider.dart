import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pets_care_two/src/models/pet_model.dart';

class PetProvider {
  final String _url = 'https://flutter-varios-30291.firebaseio.com';

  Future<bool> crearMascota(PetModel mascota) async {
    final url = Uri.parse('$_url/pets-data.json');

    final resp = await http.post(url, body: petModelToJson(mascota));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<PetModel>> listaMascota() async {
    final url = Uri.parse('$_url/pets-data.json');

    final resp = await http.get(url);

    List<PetModel> petModels = List<PetModel>();

    Map<dynamic, dynamic> values = json.decode(resp.body);

    values.forEach((key, value) {
      PetModel model = PetModel();
      model.nombre = value['nombre'];
      model.raza = value['raza'];
      model.tipo = value['tipo'];
      model.edad = value['edad'];
      petModels.add(model);
    });

    return petModels;
  }
}
