import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart/provider/cart_provider.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: StreamBuilder<double>(
          stream: _provider.getTotal(),
          builder: (context, snapshot) => CheckoutCard(
                total: snapshot.data ?? 0.0,
              )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Your Cart",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
