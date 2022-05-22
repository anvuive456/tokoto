import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/admin/screens/detail_purchase/detail_purchase.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);
    return SafeArea(
        child: StreamBuilder<List<String>>(
      stream: _provider.getAllPurchased(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();
        if (!snapshot.hasData) return NoDataWidget();
        var list = snapshot.data!;
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: list.length,
          itemBuilder: (context, index) => StreamBuilder<String>(
              stream: _provider.getUserName(list[index]),
              builder: (context, snapshot) => ListTile(
                onTap: (){
                  Navigator.pushNamed(context, DetailPurchase.routeName,arguments: DetailPurchaseArgument(list[index]));
                },
                    title: Text(snapshot.data ?? ''),
                  )),
        );
      },
    ));
  }
}
