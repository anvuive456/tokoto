import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/history.dart';
import 'package:shop_app/screens/history/components/history_card.dart';
import 'package:shop_app/screens/history/provider/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  static String routeName = '/history';

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<HistoryProvider>(context);
    return Scaffold(

        appBar: AppBar(
          title: Text('History',style: TextStyle(color: Colors.black),),
        ),
        body: StreamBuilder<List<History>>(
          stream: _provider.getHistory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingWidget();
            if (!snapshot.hasData) return NoDataWidget();
            var list = snapshot.data!;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                itemCount: list.length,
                itemBuilder: (_, index) => HistoryCard(history: list[index]));
          },
        ));
  }
}
