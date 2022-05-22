import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';

class Statistic extends StatelessWidget {
  static String routeName='/statistic';

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Statistic',style: TextStyle(color: Colors.black),),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Product Number'),
              trailing: StreamBuilder<num>(
                  stream: _provider.productNumber(),
                  builder:(context, snapshot) =>  Text('${snapshot.data.toString()}')),
            ),
            ListTile(
              title: Text('Total Revenue'),
              trailing:
                StreamBuilder<num>(
                    stream:  _provider.totalRevenue(),
                    builder:(context, snapshot) =>  Text('${snapshot.data.toString()}')),

            ),
          ],
        ));
  }
}
