import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/favourite/components/favourite_header.dart';
import 'package:shop_app/screens/favourite/provider/favourite_provider.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavouriteProvider>(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            FavouriteHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(
                title: "Favourites",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            _buildlist(provider),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }

  Widget _buildlist(FavouriteProvider provider) {
    return StreamBuilder<List<Product>>(
        stream: provider.getFavouriteProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          if (snapshot.hasError)
            return Center(child: ErrorWidget(snapshot.error!));
          else if (!snapshot.hasData || snapshot.data!.isEmpty)
            return NoDataWidget();
          var list = snapshot.data!;
          print(list[0].isFavourite);
          return Wrap(
            spacing: getProportionateScreenWidth(20),
            runSpacing: getProportionateScreenWidth(20),
            children: list.map((e) => ProductCard(product: e)).toList(),
          );
        });
  }
}
