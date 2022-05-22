import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/admin/screens/detail_purchase/detail_purchase.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/models/history.dart';
import 'package:shop_app/screens/history/components/history_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailPurchaseArgument agrs =
    ModalRoute.of(context)!.settings.arguments as DetailPurchaseArgument;
    var _provider = Provider.of<AdminProvider>(context);
    return StreamBuilder<List<History>>(
      stream: _provider.getUserPurchase(agrs.userId),
      builder:(context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting) return LoadingWidget();
        if(!snapshot.hasData) return NoDataWidget();
        var list = snapshot.data!;
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
        return HistoryCard(history: list[index],canChangeStatus:true,userId: agrs.userId,);
      },);
    },);
  }
}
