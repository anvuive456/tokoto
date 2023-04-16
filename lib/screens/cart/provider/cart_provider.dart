
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';

class CartProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<List<Cart>> getCart() {
    return _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid)
        .collection('MyCart')
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        var data = e.data();
        var _product = Product.fromJson(data['product'] as Map<String,dynamic>);
        return Cart(product: _product, numOfItem: data['itemNum']);
      }).toList();
    });
  }

  Stream<double> getTotal() {
    return _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid)
        .collection('MyCart')
        .snapshots()
        .map((event) {
      double total = 0.0;
      event.docs.forEach((element) {
        var data = element.data();
        int itemNum = data['itemNum'];
        var product = Product.fromJson(data['product']);
        total = total + (itemNum * product.price);
      });
      return double.parse(total.toStringAsFixed(1));
    });
  }

  Future<void> addCart(Cart cart) async {
    await _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid)
        .collection('MyCart')
        .doc(cart.product.id)
        .set({'product': cart.product.toJson(), 'itemNum': cart.numOfItem});

    //this is for prevent virtual doc
    await _store.collection('Carts').doc(_auth.currentUser!.uid).set({});
  }

  Future<void> removeCart({required Cart cart}) async {
    await _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid)
        .collection('MyCart')
        .doc(cart.product.id)
        .delete();
  }

  Future<void> setCartNum({required String cartId, required int num}) async {
    await _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid)
        .collection('MyCart')
        .doc(cartId)
        .update({'itemNum': num});
  }

  Future<bool> isInCart({required String cartId}) async {
    var snapshot = await _store
        .collection('Carts')
        .doc(_auth.currentUser!.uid)
        .collection('MyCart')
        .doc(cartId)
        .get();
    if (snapshot.exists) return true;
    return false;
  }
}
