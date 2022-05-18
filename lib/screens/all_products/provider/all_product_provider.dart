import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/all_products/all_products.dart';

class AllProductProvider extends ChangeNotifier {
  final _store = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProduct(Category category) {
    String collectionName = '';

    switch (category) {
      case Category.all:
        collectionName = 'Products';
        break;
      case Category.mobilePhones:
        collectionName = 'SmartPhones';
        break;
      case Category.fashion:
        collectionName = 'Fashions';
        break;
    }
    if (category == Category.all)
      return _store
          .collection('Products')
          .snapshots()
          .map<List<Product>>((event) {
        return event.docs.map((e) {
          print(e.data());
          var data = e.data();
          return Product(
              id: data['id'],
              description: data['description'],
              title: data['title'],
              image: data['image'],
              price: data['price'],
              isFavourite: data['isFavourite'],
              isPopular: data['isPopular'],
              rating: data['rating'],
              readMore: data['readMore']);
        }).toList();
      });
    else
      return _store
          .collection('Products')
          .snapshots()
          .map<List<Product>>((event) {
        return event.docs
            .where((element) => element.data()['category'] == collectionName)
            .map((e) {
          print(e.data());
          var data = e.data();
          return Product(
              id: data['id'],
              description: data['description'],
              title: data['title'],
              image: data['image'],
              price: data['price'],
              isFavourite: data['isFavourite'],
              isPopular: data['isPopular'],
              rating: data['rating'],
              readMore: data['readMore']);
        }).toList();
      });
  }

  Stream<List<Product>> getPopularProducts() {
    return _store.collection('Products').snapshots().map((event) {
      return event.docs
          .where((element) => element.data()['isPopular'] == true)
          .map((e) {
        var data = e.data();
        return Product(
            id: data['id'],
            description: data['description'],
            title: data['title'],
            image: data['image'],
            price: data['price'],
            isFavourite: data['isFavourite'],
            isPopular: data['isPopular'],
            rating: data['rating'],
            readMore: data['readMore']);
      }).toList();
    });
  }
}
