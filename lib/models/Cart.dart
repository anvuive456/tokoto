import 'package:flutter/material.dart';

import 'Product.dart';
import 'Product.dart';

class Cart {
  Product product = Product(
      id: 'id',
      image: 'image',
      title: 'title',
      price: 10,
      description: 'description',
      readMore: 'readMore');
  int numOfItem=1;

  Cart({required this.product, required this.numOfItem});

  Cart.fromJson(Map<String, dynamic> obj) {
    this.product = Product.fromJson(obj['product']);
    this.numOfItem = obj['itemNum'];
  }

  Map<String,dynamic> toJson(){
    return {
      'product':this.product.toJson(),
      'itemNum':this.numOfItem,
    };
  }
}

// Demo data for our cart
