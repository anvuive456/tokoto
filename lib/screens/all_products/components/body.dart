import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/all_products/all_products.dart';
import 'package:shop_app/screens/all_products/provider/all_product_provider.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'header.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatefulWidget {
  final Category category;

  const Body({Key? key, required this.category}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AllProductProvider>(context);

    Widget _buildList() {
      return StreamBuilder<List<Product>>(
        stream: _provider.getAllProduct(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          if (snapshot.hasError)
            return Center(child: ErrorWidget(snapshot.error!)); else
          if (!snapshot.hasData) return NoDataWidget();
          var list = snapshot.data!;
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: getProportionateScreenWidth(20),
            runSpacing: getProportionateScreenWidth(20),
            children: list.map((e) => ProductCard(product: e)).toList(),
          );
        },
      );
    }

    String _getName(){
      switch(widget.category){
        case Category.fashion: return 'Fashion';
        case Category.mobilePhones: return 'Smart phones';
        default: return 'All products';
      }
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
              child: SectionTitle(title: _getName(),),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            _buildList()
          ],
        ),
      ),
    );
  }
}
