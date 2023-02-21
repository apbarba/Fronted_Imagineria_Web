import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  _HomeStateController createState() => _HomeStateController();
}

class _HomeStateController extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Imagineros'),
    Text('Obras'),
    Text('Categorias'),
  ];

  static const List<BottomNavigationBarItem> _navigationItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Imagineros"),
    BottomNavigationBarItem(icon: Icon(Icons.person_3_rounded), label: "Obras"),
    BottomNavigationBarItem(
        icon: Icon(Icons.library_books), label: "Categorias")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              // Text(
              // 'Welcome, ${user.name}',
              // style: TextStyle(fontSize: 24),
              // ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                //textColor: Theme.of(context).primaryColor,
                style: TextButton.styleFrom(
                    primary: Theme.of(context).canvasColor),
                child: Text('Logout'),
                onPressed: () {
                  authBloc.add(UserLoggedOut());
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
