import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/all_products/provider/all_product_provider.dart';
import 'package:shop_app/screens/popular/popular.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
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
            return Center(child: ErrorWidget(snapshot.error!));
          else if (!snapshot.hasData) return NoDataWidget();
          var list = snapshot.data!;
          return SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length <= 5 ? list.length : 5, // chi duoc lay 5 san pham tren man hinh chinh
              itemBuilder: (_, index) => ProductCard(product: list[index]),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {
            Navigator.pushNamed(context, Popular.routeName);
          }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        _buildList()
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       ...List.generate(
        //         demoProducts.length,
        //         (index) {
        //           if (demoProducts[index].isPopular)
        //             return ProductCard(product: demoProducts[index]);
        //
        //           return SizedBox
        //               .shrink(); // here by default width and height is 0
        //         },
        //       ),
        //       SizedBox(width: getProportionateScreenWidth(20)),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
