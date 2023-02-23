import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/models/obras.dart';
import 'package:flutter_bloc_authentication/repositories/AuthenticationRepository.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc_authentication/models/user.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication_bloc.dart';

import '../repositories/obras_repository.dart';

class AddObrasPage extends StatefulWidget {
  final ObrasRepository obrasRepository;
  // final AuthenticationRepository authenticationRepository;

  AddObrasPage({required this.obrasRepository});

  @override
  _AddObrasPageState createState() => _AddObrasPageState();
}

class _AddObrasPageState extends State<AddObrasPage> {
  //ObrasRepository obrasRepository = ObrasRepository();
  late final User user;
  late DateTime _selectedDate;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController estiloController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        fechaController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    fechaController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
  }

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
                controller: precioController,
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
                controller: tituloController,
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
                controller: imgController,
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
                controller: estadoController,
                decoration: InputDecoration(
                  labelText: 'estado',
                  hintText: 'Estado de la obra',
                  icon: new Icon(Icons.edit),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                height: 50,
                child: TextField(
                  controller: fechaController,
                  decoration: InputDecoration(
                    labelText: 'fecha',
                    hintText: 'Fecha',
                    icon: new Icon(Icons.date_range),
                  ),
                  readOnly: true,
                ),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: estiloController,
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final AuthenticationBloc authBloc =
                    BlocProvider.of<AuthenticationBloc>(context);
                final String name = nameController.text;
                final double precio = double.parse(precioController.text);
                final String titulo = tituloController.text;
                final String img = imgController.text;
                final String estado = estadoController.text;
                final DateTime fecha = DateTime.parse(fechaController.text);
                final String estilo = estiloController.text;
                final ObrasRequest obra = ObrasRequest(
                  name: name,
                  precio: precio,
                  titulo: titulo,
                  img: img,
                  estado: estado,
                  fecha: fecha,
                  estilo: estilo,
                );
                await widget.obrasRepository.addObras(obra);
                Navigator.pop(context);
              },
              child: Text('Agregar obra'),
            ),
          ],
        ),
      ),
    );
  }
}
