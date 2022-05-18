import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DetailProductProvider extends ChangeNotifier{
  final _store = FirebaseFirestore.instance;

  Future<void> likeProduct(String productId) async {
    await _store.collection('Products').doc(productId.trim()).update({
      'isFavourite':true
    });
  }
  Future<void> unLikeProduct(String productId) async {
  await  _store.collection('Products').doc(productId.trim()).update({
      'isFavourite':false
    });
  }
}