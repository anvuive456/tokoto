import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/all_products/components/header.dart';
import 'package:shop_app/screens/all_products/provider/all_product_provider.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AllProductProvider>(context);

    Widget _buildList() {
      return StreamBuilder<List<Product>>(
        stream: _provider.getPopularProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          if (snapshot.hasError)
            return Center(child: ErrorWidget(snapshot.error!)); else
          if (!snapshot.hasData) return NoDataWidget();
          var list = snapshot.data!;
          return Wrap(
            spacing: getProportionateScreenWidth(20),
            runSpacing: getProportionateScreenWidth(20),
            children: list.map((e) => ProductCard(product: e)).toList(),
          );
        },
      );
    }



    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Header(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(title: 'Popular products',),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            _buildList()
          ],
        ),
      ),
    );
  }
}
