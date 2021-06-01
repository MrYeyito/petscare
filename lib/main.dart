import 'package:flutter/material.dart';
import 'package:pets_care_two/src/pages/home_page.dart';
import 'package:pets_care_two/src/pages/list_pets_page.dart';
import 'package:pets_care_two/src/pages/pet_register_page.dart';
import 'package:pets_care_two/src/pages/user_register_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets Care',
      initialRoute: 'home',
      routes: {
        'home' : ( BuildContext context ) => HomePage(),
        'user-register' : ( BuildContext context ) => UserRegisterPage(),
        'pet-register' : ( BuildContext context ) => PetRegisterPage(),
        'list-pet-register' : ( BuildContext context ) => ListPetsPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.pinkAccent[400]
      ),
    );
  }
}