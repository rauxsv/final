import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_market/presentation/bloc/authen_bloc.dart';
import 'package:flutter_market/presentation/bloc/authen_event.dart';
import 'package:flutter_market/presentation/bloc/authen_state.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Вход")),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            Navigator.pushNamed(context, '/userPage');
          }
        },
        child: SingleChildScrollView( 
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email), 
                  border: OutlineInputBorder(), 
                ),
              ),
              SizedBox(height: 10), 
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  prefixIcon: Icon(Icons.lock), 
                  border: OutlineInputBorder(), 
                ),
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    AuthenticationLoginRequested(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                child: Text('Войти'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, 
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), 
                ),
              ),
              SizedBox(height: 10), 
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registerPage');
                },
                child: Text('Регистрация'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen, 
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}