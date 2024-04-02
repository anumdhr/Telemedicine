import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password, NewUserModel newUserModel) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        // Store additional user data in Firestore
        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(newUserModel.toJson());
      }

      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      print("1");
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Logger().d(credential.user);

      return credential.user;
    } catch (e) {
      Logger().d(e);
      print("Some error occured");
    }
    return null;
  }
}
