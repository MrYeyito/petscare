import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_care_two/src/models/user_model.dart';
import 'package:pets_care_two/src/providers/user_provider.dart';



class UserRegisterPage extends StatefulWidget {

  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  final UserModel user = new UserModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dinos tus datos'),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _crearNombre(),
              _crearEmail(),
              _crearEdad(),
              SizedBox(height: 100),
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
        hintText: 'Pepito Perez'
      ),
      onSaved: (value) => user.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingresa tu nombre';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      initialValue: user.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon( Icons.alternate_email ),
        hintText: 'ejemplo@correo.com',
        labelText: 'Correo electrónico'
      ),
      onSaved: (value) => user.email = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Edad',
        icon: Icon(Icons.date_range),
        hintText: '25'
      ),
      onSaved: (value) => user.edad = int.parse(value),
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
                color: Colors.white
            )),
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

          userProvider.crearUsuario(user);

          Navigator.pushReplacementNamed(context, 'pet-register');

        },
      ),
    );
  }

}