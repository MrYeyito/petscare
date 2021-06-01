import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pets_care_two/src/models/user_model.dart';

class UserProvider {

  final String _url = 'https://flutter-varios-30291.firebaseio.com';

  Future<bool> crearUsuario(UserModel user) async {
    final url = Uri.parse('$_url/user-data.json');

    final resp = await http.post(url, body: userModelToJson(user));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}