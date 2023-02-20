import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_event.dart';
import 'package:flutter_bloc_authentication/blocs/obras/obras_state.dart';
import 'package:flutter_bloc_authentication/models/models.dart';
import 'package:http_interceptor/http_interceptor.dart';

class ObrasPage extends StatefulWidget {
  @override
  _ObrasPageState createState() => _ObrasPageState();
}

class _ObrasPageState extends State<ObrasPage> {
  final ObrasBloc _newBloc = ObrasBloc();

  @override
  void initState() {
    _newBloc.add(GetObrasList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Obras')),
      body: _buildObrasList(),
    );
  }

  Widget _buildObrasList() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
          create: (_) => _newBloc,
          child: BlocListener<ObrasBloc, ObrasState>(
            listener: (context, state) {
              if (state is ObrasError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child:
                BlocBuilder<ObrasBloc, ObrasState>(builder: (context, state) {
              if (state is ObrasInitial) {
                return _buildLoading();
              } else if (state is ObrasLoading) {
                return _buildLoading();
              } else if (state is ObrasLoaded) {
                return _buildCard(context, state.obrasModel);
              } else if (state is ObrasError) {
                return Container();
              } else {
                return Container();
              }
            }),
          )),
    );
  }

  Widget _buildCard(BuildContext context, ObrasModel model) {
    return ListView.builder(
      itemCount: model.name.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Name: ${model.name[index].length}"),
                  Text("Titulo: ${model.titulo}"),
                  Text("Precio: ${model.precio}"),
                  Text("Estado: ${model.estado}"),
                  Text("Fecha: ${model.estilo}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() =>
      Center(child: CircularProgressIndicator(color: Colors.blue));
}
