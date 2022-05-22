import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/app_instance.dart';
import 'package:shop_app/models/profile_data.dart';

class SignInProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  bool loading = false;

  showLoading() {
    this.loading = true;
    notifyListeners();
  }

  hideLoading() {
    this.loading = false;
    notifyListeners();
  }

  Future<String> loginWithEmail(
      {required String email,
      required String password,
      bool saveData = false}) async {
    showLoading();
    try {
      var credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var profile =
          await _store.collection('Profiles').doc(credential.user!.uid).get();
      if (saveData == true)
        AppInstance().saveProfile(ProfileData.fromJson(profile.data()!));
      if(profile.data()!['isAdmin']!=null && profile.data()!['isAdmin']==true) return 'ToAdmin';
      return 'Success';
    } on FirebaseAuthException catch (e) {
      hideLoading();
      return e.message ?? 'undefined error';
    }
  }

  Future<String> sendEmailReset({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'undefined error';
    }
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      var cresdential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _store.collection('Profiles').doc(cresdential.user!.uid).set({
        'email': email,
        'password': password,
      });
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'undefined error';
    }
  }

  Future<void> otp(
      {required Function(PhoneAuthCredential phoneAuthCredential)
          verificationCompleted,
      required Function(FirebaseException exception) verificationFailed,
      required Function(String a, int? b) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    var documentSnapshot =
        await _store.collection('Profiles').doc(_auth.currentUser!.uid).get();

    String phoneNumber = documentSnapshot['phoneNumber'];
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<String> completeProfile(
      {required String firstName,
      String lastName = '',
      required String phoneNumber,
      required String address}) async {
    try {
      await _store.collection('Profiles').doc(_auth.currentUser!.uid).set({
        'name': firstName + ' ' + lastName,
        'phoneNumber': phoneNumber,
        'address': address
      });

      var snapshot =
          await _store.collection('Profiles').doc(_auth.currentUser!.uid).get();
      AppInstance().saveProfile(ProfileData.fromJson(snapshot.data()!));
      return 'Success';
    } on FirebaseException catch (e) {
      return e.message ?? 'undefined error';
    }
  }

  Future<String> addPhoneNumber(PhoneAuthCredential phoneCredential) async {
    try {
      await _auth.currentUser!.updatePhoneNumber(phoneCredential);
      return 'Success';
    } on FirebaseException catch (e) {
      return e.message ?? 'undefined error';
    }
  }

  Future<String> updateProfile(
      {
      String? name,

      String? phoneNumber,
      String? address}) async {
    try {
      if (name == null || name.isEmpty) return 'name must not be empty';
      if (phoneNumber == null || phoneNumber.isEmpty)
        return 'phoneNumber must not be empty';
      if (address == null || address.isEmpty)
        return 'address must not be empty';

      await _store.collection('Profiles').doc(_auth.currentUser!.uid).update({
        'name': name,
        'phoneNumber': phoneNumber,
        'address': address
      });

      return 'Success';
    } on FirebaseException catch (e) {
      return e.message ?? 'undefined error';
    }
  }
// Future<String> loginWithGoogle() async {
//   showLoading();
//   try {
//     await _auth.signIn(email: email, password: password);
//     return 'Success';
//   } on FirebaseAuthException catch (e) {
//     hideLoading();
//     return e.message ?? 'undefined error';
//   }
// }

}
