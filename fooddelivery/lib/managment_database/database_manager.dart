import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{

  final CollectionReference user = FirebaseFirestore.instance.collection('users');

  Future<void> createUserData(String name ,String phone ,String uid)async{
  return await user.doc(uid).set({
    'uid': uid,
    'name_user':name,
    'phone_user':phone,
  });
  }



}