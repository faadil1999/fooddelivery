
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'User.dart';
import 'database_manager.dart';

class AuthentificationService{

  final FirebaseAuth _auth =FirebaseAuth.instance;
  String getUid = "";


  AppUser _userFromFirebaseUser(User user){
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email , String password) async{

    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user =result.user;
      return user;
    }catch(e){
      print(e.toString());
    }

  }

  Future createNewUser(String email , String password , String name,String phone  ) async{

    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await DatabaseManager().createUserData(name , phone , user.uid);

      this.getUid = user.uid;
      print("Le uid de lutilisateur est ------------------${this.getUid}-----------------");
    }catch(e){
      print(e.toString());
    }


  }

}