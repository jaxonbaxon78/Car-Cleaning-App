import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_car_cleaning/appt_form.dart';
import 'package:flutter_application_car_cleaning/firebase_options.dart';
import 'package:flutter_application_car_cleaning/login.dart';
// import 'package:flutter_application_car_cleaning/homepage.dart';
//import 'package:flutter_application_car_cleaning/login.dart';
// 
//import 'package:flutter_application_car_cleaning/login.dart';
// import 'package:flutter_application_car_cleaning/signup.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(53, 114, 239, 1)),
      ),
      debugShowCheckedModeBanner: false,
      home: const login(),
    );
  }
}