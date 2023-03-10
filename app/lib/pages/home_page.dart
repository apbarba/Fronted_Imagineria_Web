import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import 'package:flutter_bloc_authentication/pages/categorias_page.dart';
import 'package:flutter_bloc_authentication/pages/obras_page.dart';
import '../models/models.dart';
import 'Imaginero_Page.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Bienvenid@ ${user.name}',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                  //textColor: Theme.of(context).primaryColor,
                  style: TextButton.styleFrom(),
                  child: Text('Logout'),
                  onPressed: () {
                    authBloc.add(UserLoggedOut());
                  },
                ),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ObrasPage()));
                      },
                      child: Text('Obras')),
                ),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoriasPage(user: user)));
                      },
                      child: Text('Categorias')),
                ),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ImaginerosPage(user: user)));
                      },
                      child: Text('Imagineros')),
                ),
              ],
            ),
          ),
        )
        /*   bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.construction),
            label: 'Obras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: 'maginero',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
        ],
      ),*/
        );
  }
}
