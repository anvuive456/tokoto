import 'package:flutter/material.dart';
import './components/body.dart';
class AddProduct extends StatelessWidget {
  static String routeName ='/addProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'),),
      body: Body(),
    );
  }
}
