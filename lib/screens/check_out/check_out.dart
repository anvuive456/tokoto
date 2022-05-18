import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart/provider/cart_provider.dart';
import 'package:shop_app/screens/check_out/components/pay_card.dart';
import 'components/body.dart';

class CheckOut extends StatelessWidget {
  static String routeName = '/checkOut';

  @override
  Widget build(BuildContext context) {
    var _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check out",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
      bottomNavigationBar: StreamBuilder<double>(
          stream: _cartProvider.getTotal(),
          builder: (context, snapshot) => PayCard(
                total: snapshot.data ?? 0.0,
              )),
    );
  }
}
