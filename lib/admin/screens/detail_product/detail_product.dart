import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import './components/body.dart';

class DetailProduct extends StatelessWidget {
  static String routeName = '/adminDetailProduct';

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    ValueNotifier<bool> isUpdate = ValueNotifier(false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                isUpdate.value = !isUpdate.value;
              },
              child: ValueListenableBuilder<bool>(
                  valueListenable: isUpdate,
                  builder: (context, value, child) => value
                      ? Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        )
                      : Text(
                          'Update',
                          style: TextStyle(color: Colors.black),
                        )))
        ],
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: isUpdate,
        builder: (context, value, child) => Body(
          isUpdate: value,
          product: agrs.product,

        ),
      ),
    );
  }
}
