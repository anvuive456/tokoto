import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class EditProfileProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;


  Future<void> editProfile(
      {
      String? name,
      String? phoneNumber,
      String? address}) async {
    if(name !=null){
      _updateSingleField('name', name);
    }
    if(phoneNumber !=null){
      _updateSingleField('phoneNumber', phoneNumber);
    }
    if(address !=null){
      _updateSingleField('name', address);
    }


  }

  _updateSingleField(String fieldName, String data) {
    _store
        .collection('Profiles')
        .doc(_auth.currentUser!.uid)
        .update({fieldName: data});
  }
}
