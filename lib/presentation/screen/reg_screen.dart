import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_market/domain/entities/userdata_entities.dart';
import 'package:flutter_market/presentation/bloc/authen_bloc.dart';
import 'package:flutter_market/presentation/bloc/authen_event.dart';
import 'package:flutter_market/presentation/bloc/authen_state.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Registration.tr(), style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            Navigator.pushNamed(context, '/bottom');
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  AppUser user = AppUser(
                    name: nameController.text,
                    email: emailController.text,
                    age: ageController.text,
                    country: countryController.text,
                    gender: genderController.text,
                    phone: phoneController.text,
                  );
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    AuthenticationSignUpRequested(
                      user: user,
                      password: passwordController.text,
                    ),
                  );
                },
                child: Text(LocaleKeys.Register.tr()),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }


  Widget _buildTextField(TextEditingController controller, IconData icon, String labelText) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
