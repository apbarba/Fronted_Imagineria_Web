import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc_authentication/models/user.dart';

import '../repositories/obras_repository.dart';

class AddObrasPage extends StatefulWidget {
  late final User user;

  @override
  _AddObrasPageState createState() => _AddObrasPageState();
}

class _AddObrasPageState extends State<AddObrasPage> {
  ObrasRepository obrasRepository = ObrasRepository();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController estiloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        padding: const EdgeInsets.only(
            top: 62, left: 12.0, right: 12.0, bottom: 12.0),
        children: [
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
                hintText: 'Nombre de la obra',
                icon: new Icon(Icons.person),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'precio',
                hintText: 'Precio',
                icon: new Icon(Icons.money),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'titulo',
                hintText: 'Titulo de la Obra',
                icon: new Icon(Icons.person_2),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'img',
                hintText: 'Imagen de la obra',
                icon: new Icon(Icons.image),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'estado',
                hintText: 'Estado de la obra',
                icon: new Icon(Icons.edit),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'fecha',
                hintText: 'Fecha',
                icon: new Icon(Icons.date_range),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'estilo',
                hintText: 'Estilo de la obra',
                icon: new Icon(Icons.person_4),
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.only(top: 44.0),
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                obrasRepository.addObras(
                    nameController.text.trim(),
                    precioController.text.trim(),
                    tituloController.text.trim(),
                    imgController.text.trim(),
                    estadoController.text.trim(),
                    fechaController.text.trim() as DateTime,
                    estiloController.text.trim());

                Navigator.pop(context, true);
              },
              child: Text(
                'Añadir',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
