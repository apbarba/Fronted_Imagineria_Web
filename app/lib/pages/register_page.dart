import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import 'package:flutter_bloc_authentication/blocs/register/register_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/register/register_event.dart';
import 'package:flutter_bloc_authentication/blocs/register/register_state.dart';
import 'package:flutter_bloc_authentication/config/locator.dart';
import 'package:flutter_bloc_authentication/services/authentication_service.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationNotAuthenticated) {
              return _AuthForm();
            }
            Navigator.of(context).pop();
            return Text('Se debería volver para atras');
          },
        ),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final authService = RepositoryProvider.of<AuthenticationService>(context);
    final authService = getIt<JwtAuthenticationService>();
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(authBloc, authService),
        child: _RegisterForm(),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  __RegisterFormState createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _registerBloc = BlocProvider.of<RegisterBloc>(context);

    _onRegisterButtonPressed() {
      if (_key.currentState!.validate()) {
        _registerBloc.add(RegisterButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
          verifyPassword: _verifyPasswordController.text,
          email: _emailController.text,
          name: _nameController.text,
        ));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          _showError(state.error);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _key,
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        isDense: true,
                      ),
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null) {
                          return 'User Name is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        isDense: true,
                      ),
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null) {
                          return 'Password is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Verify Password',
                        filled: true,
                        isDense: true,
                      ),
                      obscureText: true,
                      controller: _verifyPasswordController,
                      validator: (value) {
                        if (value == null) {
                          return 'Verify Password is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        isDense: true,
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value == null) {
                          return 'Email is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        filled: true,
                        isDense: true,
                      ),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null) {
                          return 'Full Name is required.';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                    ),
                    child: Text('REGISTER'),
                    onPressed: state is RegisterLoading
                        ? () {}
                        : _onRegisterButtonPressed,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }
}
