import 'package:flutter/material.dart';
import 'components/body.dart';

class AllProductsScreen extends StatelessWidget {
  static String routeName = '/allProducts';

  @override
  Widget build(BuildContext context) {
    final AllProductArguments agrs =
    ModalRoute.of(context)!.settings.arguments as AllProductArguments;
    return Scaffold(
      body: Body(category: agrs.category),

    );
  }
}

class AllProductArguments {
  final Category category;
  AllProductArguments(this.category);
}

enum Category{
  mobilePhones,
  fashion,
  all
}