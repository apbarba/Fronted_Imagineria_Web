import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/category/category_bloc.dart';
import 'package:flutter_bloc_authentication/config/locator.dart';
import 'package:flutter_bloc_authentication/models/categoria.dart';
import 'package:flutter_bloc_authentication/models/obras.dart';
import 'package:flutter_bloc_authentication/pages/obras_page.dart';
import 'package:flutter_bloc_authentication/repositories/AuthenticationRepository.dart';
import 'package:flutter_bloc_authentication/repositories/category_repository.dart';
import 'package:flutter_bloc_authentication/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc_authentication/models/user.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

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

  late DateTime _selectedDate;
  final _localStorageService = GetStorage();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController estiloController = TextEditingController();
  late List<Categoria> lista;
  late List<Categoria?> _categoriasElegidas = [];
  late CategoryBloc _categoryBloc;
  late CategoryRepository categoryRepository;
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
    categoryRepository = GetIt.I.get<CategoryRepository>();
    fechaController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
    _categoryBloc = CategoryBloc(categoryRepository)..add(const FetchAllCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(
        bloc: _categoryBloc,
        builder: (context, state) {
          if (state is CategoryInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryFetchError) {
            return Text('Error');
          } else if (state is CategoryFetched) {
            return _categorias(context, state.categorias);
          } else {
            return const Text('Not support');
          }
        },
      ),
    );
  }
  Widget _categorias( context,List<Categoria> listaCategorias){
    return  Container(
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
                margin: const EdgeInsets.all(10),
                height: 150,
                child: MultiSelectDialogField(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  title: const Text("Categorías"),
                  buttonText: const Text("Seleccionar categoría"),
                  items: listaCategorias
                      .map((e) =>
                          MultiSelectItem(e, e.nombre))
                      .toList(),
                  listType: MultiSelectListType.LIST,
                  onConfirm: (values) {
                    _categoriasElegidas = values;
                  },
                )),
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
          
                final String name = nameController.text;
                final String precio = precioController.text;
                final String titulo = tituloController.text;
                final String img = imgController.text;
                final String estado = estadoController.text;
                final String fecha = fechaController.text;
                final String estilo = estiloController.text;
                final ObrasRequest obra = ObrasRequest(
                  name: name,
                  precio: precio,
                  titulo: titulo,
                  img: img,
                  estado: estado,
                  fecha: fecha,
                  estilo: estilo,
                  categoria:_categoriasElegidas[0]?.id,
                );
                await widget.obrasRepository.addObras(obra);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => ObrasPage())));
              },
              child: Text('Agregar obra'),
            ),
          ],
        ),
      );
  }
}
