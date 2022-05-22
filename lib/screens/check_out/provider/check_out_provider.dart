import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanoid/nanoid.dart';
import 'package:shop_app/models/Cart.dart';

class CheckOutProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  late TextEditingController address;

  late TextEditingController phone;
  DateTime receiveTime =
      DateTime(2022, DateTime.now().month, DateTime.now().day + 3);

  Future<void> init() async {
    var snapshot =
        await _store.collection('Profiles').doc(_auth.currentUser!.uid).get();
    String userAddress = snapshot.data()!['address'];
    String userPhone = snapshot.data()!['phoneNumber'];
    address = TextEditingController(text: userAddress);
    phone = TextEditingController(text: userPhone);
  }

  void setReceiveTime(DateTime date) {
    receiveTime = date;
  }

  Future<void> pay({required List<Cart> carts}) async {
    var id = customAlphabet('1234567890abcdefghilkmnop', 10);
    var doc = await _store
        .collection('History')
        .doc(_auth.currentUser!.uid)
        .collection('MyHistory')
        .doc(id).set({
      'id':id,
      'receiveDate': receiveTime,
      'purchasedDate': DateTime.now(),
      'phoneNumber': phone.value.text,
      'address': address.value.text,
      'status': false,
      'carts': carts.map((e) => e.toJson()).toList()
    });


    //this is for prevent virtual doc
    await _store.collection('History').doc(_auth.currentUser!.uid).set({});

    final batch = _store.batch();
    var snapshot = await _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid.trim())
        .collection('MyCart')
        .get();
    snapshot.docs.forEach((element) {
      batch.delete(element.reference);
    });
    await batch.commit();
  }
}
