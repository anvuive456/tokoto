import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/provider/cart_provider.dart';
import 'package:shop_app/size_config.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool isAddedToCart = false;


  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CartProvider>(context);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () async {
                  if (await canLaunchUrlString(widget.product.readMore))
                    launchUrlString(widget.product.readMore);
                },
              ),
              Column(
                children: [
                  // ColorDots(product: product),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.15,
                        right: SizeConfig.screenWidth * 0.15,
                        bottom: getProportionateScreenWidth(40),
                        top: getProportionateScreenWidth(15),
                      ),
                      child: FutureBuilder<bool>(
                        future: _provider.isInCart(cartId: widget.product.id),
                        builder:(context, snapshot) => DefaultButton(
                          text: snapshot.hasData? snapshot.data!?"Already In Cart" : "Add To Cart": "loading...",
                          press: () {
                            if(snapshot.hasData && !snapshot.data!) {
                              _provider.addCart(Cart(product: widget.product,numOfItem: 1));
                              setState(() {

                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
