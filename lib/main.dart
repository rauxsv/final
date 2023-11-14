import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_market/presentation/bloc/authen_bloc.dart';
import 'package:flutter_market/authen_repository.dart';
import 'package:flutter_market/firebase_options.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_market/presentation/screen/login_screen.dart';
import 'package:flutter_market/presentation/screen/reg_screen.dart';
import 'package:flutter_market/presentation/screen/splash_screen.dart';
import 'package:flutter_market/presentation/screen/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(authenticationRepository: authenticationRepository),
      child: MaterialApp(
        title: 'Flutter Market',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/loginPage': (context) => LoginPage(),
          '/registerPage': (context) => RegisterPage(),
          '/userPage': (context) => UserPage(),
          '/splashPage':(context) => SplashScreen(),
        },
      ),
    );
  }
}