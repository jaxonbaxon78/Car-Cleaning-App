import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_car_cleaning/util/exception.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Login({
    required String email,
    required String password,
  }) async {
    try {
      if(email.isNotEmpty && password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      }else{
        throw exceptions('enter all fields');
      }
    }on FirebaseException catch (e){
      throw exceptions(e.message.toString());
    }
  }

  Future<void> Signup({
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String confirm_password,
  }) async {
    try{
      if(email.isNotEmpty && password.isNotEmpty && confirm_password.isNotEmpty){
        if(password==confirm_password){
          await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
        }else{
          throw exceptions('password and confirm password should be the same');
        }
      }else{
        throw exceptions('enter all the fields');
      }
    }on FirebaseException catch(e){
      throw exceptions(e.message.toString());
    }
  }

}