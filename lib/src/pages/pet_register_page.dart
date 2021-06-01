import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_care_two/src/models/pet_model.dart';
import 'package:pets_care_two/src/providers/pet_provider.dart';

class PetRegisterPage extends StatefulWidget {
  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<PetRegisterPage> {
  final PetModel pet = new PetModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final petProvider = new PetProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ahora, dinos los datos de tu mascota'),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _crearNombre(),
              _crearTipo(),
              _crearRaza(),
              _crearEdad(),
              SizedBox(height: 70),
              _crearBoton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: 'Nombre',
          icon: Icon(Icons.supervised_user_circle),
          hintText: 'Rokko'),
      onSaved: (value) => pet.nombre = value,
      validator: (value) {
        if (value.length < 2) {
          return 'Ingresa el nombre de tu mascota';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearTipo() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Tipo',
        icon: Icon(Icons.pets),
      ),
      items: <String>['Perro', 'Gato'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
      onSaved: (value) => pet.tipo = value,
    );
  }

  Widget _crearRaza() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: 'Raza',
          icon: Icon(Icons.pets),
          hintText: 'British Shorthair'),
      onSaved: (value) => pet.raza = value,
      validator: (value) {
        if (value.length < 2) {
          return 'Ingresa la raza de tu mascota';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Edad',
        icon: Icon(Icons.date_range),
        hintText: '5'
      ),
      onSaved: (value) => pet.edad = int.parse(value),
    );
  }

  Widget _crearBoton() {
    return Container(
      width: 140,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Enviar',
                style: GoogleFonts.indieFlower(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Icon(
              Icons.send,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () {

          if (!_formKey.currentState.validate()) {
            return;
          }

          _formKey.currentState.save();

          petProvider.crearMascota(pet);

          Navigator.pushReplacementNamed(context, 'list-pet-register');

        },
      ),
    );
  }
}
