import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_data_widget.dart';
import 'package:shop_app/models/profile_data.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);
    return StreamBuilder<List<ProfileData>>(
      stream: _provider.getAllUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();
        if (!snapshot.hasData) return NoDataWidget();
        var list = snapshot.data!;
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            var data = list[index];
            return ListTile(
              title: Text(data.firstName + ' ' + data.lastName),
              subtitle: Text(data.address),
              trailing: Text(data.phoneNumber),
            );
          },
        );
      },
    );
  }
}
