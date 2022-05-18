import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/history.dart';

class HistoryProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<List<History>> getHistory() {
    return _store
        .collection('History')
        .doc(_auth.currentUser!.uid)
        .collection('MyHistory')
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        print(e.data());
        return History.fromJson(e.data());
      }).toList();
    });
  }
}
