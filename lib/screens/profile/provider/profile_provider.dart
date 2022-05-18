import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/core/app_instance.dart';

class ProfileProvider extends ChangeNotifier{
  final _auth = FirebaseAuth.instance;

  Future<String> logout() async {
   try{
     AppInstance().removeProfile();
     await _auth.signOut();
     return 'Success';
   } on FirebaseAuthException catch(e){
     return e.message ?? 'undefined error';
   }
  }
}