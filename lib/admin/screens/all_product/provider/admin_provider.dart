import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/history.dart';
import 'package:shop_app/models/profile_data.dart';

class AdminProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProduct() {
    return _store.collection('Products').snapshots().map((event) {
      return event.docs.map((e) {
        var data = e.data();
        return Product.fromJson(data);
      }).toList();
    });
  }

  Future<void> updateProduct(
    String productId,
    String title,
    String description,
    String readMore,
    double price,
    String category,
    bool isPop,
    num rating,
  ) async {
    await _store.collection('Products').doc(productId).update({
      'title': title,
      'description': description,
      'readMore': readMore,
      'isPopular': isPop,
      'category': category,
      'price': price,
      'rating': rating
    });
  }

  Stream<List<String>> getAllPurchased() {
    return _store.collection('History').snapshots().map((event) {
      return event.docs.map((e) => e.id).toList();
    });
  }

  Stream<String> getUserName(String uid) {
    return _store.collection('Profiles').doc(uid).snapshots().map((event) {
      return event.data()!['name'];
    });
  }

  Stream<List<ProfileData>> getAllUser() {
    return _store.collection('Profiles').snapshots().map((event) {
      return event.docs.map((e) {
        var data = e.data();
        return ProfileData.fromJson(data);
      }).toList();
    });
  }

  Stream<List<History>> getUserPurchase(String userId) {
    return _store
        .collection('History')
        .doc(userId.trim())
        .collection('MyHistory')
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        var data = e.data();
        var history = History.fromJson(data);
        return History.fromJson(data);
      }).toList();
    });
  }

  Future<void> changePurchaseStatus(String userId, String historyId) async {
    print(historyId);
    await _store
        .collection('History')
        .doc(userId.trim())
        .collection('MyHistory')
        .doc(historyId.trim())
        .update({
      'status': true,
    });
  }

  Stream<num> productNumber() {
    return _store.collection('Products').snapshots().map((event) {
      return event.docs.length;
    });
  }

  Stream<num> totalRevenue() {
    return _store.collection('History').snapshots().map((event) {
      num total = 0;
      event.docs.forEach((element) {
        element.reference.collection('MyHistory').get().then((a) {
          a.docs.forEach((e) {
            var listCart = e.data()['carts'] as List<dynamic>;
            listCart.forEach((value) {
              Cart cart = Cart.fromJson(value);
              total = total + cart.numOfItem * cart.product.price;
              print(total);
            });
          });
        });
      });
      print(total);
      return double.parse(total.toStringAsFixed(1));
    });
  }

  Future<void> addProduct(String id, String title, String description, String readMore,
      num price, String category, bool isPop, num rating,String image)async {
   await _store.collection('Products').doc(id).set({
      'id':id,
      'title':title,
      'description':description,
      'readMore':readMore,
      'price':price,
      'category':category,
      'isPopular':isPop,
      'rating':rating,
      'isFavourite':false,
     'image':image
    });

  }

  Future<void> removeProduct(String id)async{
    await _store.collection('Products').doc(id).delete();
  }
}
