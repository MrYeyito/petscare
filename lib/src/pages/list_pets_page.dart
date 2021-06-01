import 'package:flutter/material.dart';
import 'package:pets_care_two/src/models/pet_model.dart';
import 'package:pets_care_two/src/providers/pet_provider.dart';

class ListPetsPage extends StatelessWidget {
  final petProvider = new PetProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tus mascotas...'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, 'pet-register'),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<PetModel>>(
        future: petProvider.listaMascota(),
        initialData: List(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PetModel>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.pink,
                child: Center(
                    child: Text(
                  '${snapshot.data[index].nombre} - ${snapshot.data[index].raza} (${snapshot.data[index].edad})',
                  style: TextStyle(fontSize: 18),
                )),
              );
            },
          );
        },
      ),
    );
  }
}
