import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/admin/screens/detail_product/detail_product.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DetailProduct.routeName,
            arguments: ProductDetailsArguments(product: product));
      },
      leading: Image.network(
        product.image,
        width: 50,
      ),
      title: Text(product.title),
      trailing: TextButton(onPressed: (){
        _provider.removeProduct(product.id);
      }, child: Text('Delete',style: TextStyle(color: Colors.red),),),
    );
  }
}
