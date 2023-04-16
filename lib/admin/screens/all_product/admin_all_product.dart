import 'package:flutter/material.dart';
import 'package:shop_app/admin/screens/add_product/add_product.dart';
import './components/body.dart';
class AdminAllProduct extends StatelessWidget {
 static String routeName ='/adminAllProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Product',style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, AddProduct.routeName);
            }, icon: Icon(Icons.add))
          ],
        ),
        body: Body());
  }
}
