import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/components/product_tile.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);

    return SafeArea(
        child: StreamBuilder<List<Product>>(
      stream: _provider.getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();
        if (!snapshot.hasData) return NoDataWidget();
        var _list = snapshot.data!;
        print(_list.length);
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: _list.length,
          itemBuilder: (context, index) {
            if(index == 0) return Text('Product number: ${_list.length}',
            textAlign: TextAlign.center,style: TextStyle(color: kPrimaryColor,fontSize: 18),);
            return ProductTile(product: _list[index-1]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      },
    ));
  }
}
