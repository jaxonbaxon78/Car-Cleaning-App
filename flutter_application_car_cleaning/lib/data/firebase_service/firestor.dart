import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Firestor {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> CreateUser({
    required String email,
    required String username,
    required String passowrd,
  }) async {
    await _firebaseFirestore
        .collection('user')
        .doc(_auth.currentUser!.uid)
        .set({
      'email': email,
      'username': username,
      'password': passowrd,
    });
    return true;
  }
}