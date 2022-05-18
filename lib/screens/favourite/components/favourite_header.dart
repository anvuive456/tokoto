import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/size_config.dart';

class FavouriteHeader extends StatelessWidget {
  const FavouriteHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
