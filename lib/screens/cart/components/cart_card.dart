import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/cart/provider/cart_provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart, this.haveCount = true,
  }) : super(key: key);

  final Cart cart;
  final bool haveCount;

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CartProvider>(context);
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(cart.product.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${cart.numOfItem}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge),
                  ],
                ),
              )
            ],
          ),
        ),
        Spacer(),
        haveCount ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  if (cart.numOfItem >= 2) {
                    _provider.setCartNum(
                        cartId: cart.product.id, num: cart.numOfItem - 1);
                  }
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Icon(
                  Icons.remove,
                  color: kPrimaryColor,
                )),
            TextButton(
                onPressed: () {
                  _provider.setCartNum(
                      cartId: cart.product.id, num: cart.numOfItem + 1);
                },
                child: Icon(
                  Icons.add,
                  color: kPrimaryColor,
                ))
          ],
        ):Container()
      ],
    );
  }
}
