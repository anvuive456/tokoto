import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/core/app_instance.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/provider/cart_provider.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CartProvider>(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: StreamBuilder<List<Cart>>(
        stream: _provider.getCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          if (!snapshot.hasData ||snapshot.data!.isEmpty) return NoDataWidget();
          var list = snapshot.data!;
          AppInstance().carts = list;
          print(list[0].product.toJson());
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(list[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _provider.removeCart(cart: list[index]);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartCard(cart: list[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
