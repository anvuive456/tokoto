import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Product.dart';

class FavouriteProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;

  Stream<List<Product>> getFavouriteProducts() {
    return _store.collection('Products').snapshots().map((event) {
      return event.docs
          .where((element) => element.data()['isFavourite'] == true)
          .map((e) {
        var data = e.data();
        return Product(
            id: data['id'],
            image: data['image'],
            title: data['title'],
            price: data['price'],
            isFavourite: data['isFavourite'],
            isPopular: data['isPopular'],
            rating: data['rating'],
            description: data['description'],
            readMore: data['readMore']);
      }).toList();
    });
  }
}
