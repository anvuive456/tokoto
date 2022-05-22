import 'package:flutter/material.dart';
import './components/body.dart';
class DetailPurchase extends StatelessWidget {
  static String routeName ='/detailPurchase';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Purchase',style: TextStyle(color: Colors.black),),),
      body: Body(),
    );
  }
}
class DetailPurchaseArgument{
  String userId;
  DetailPurchaseArgument(this.userId);
}