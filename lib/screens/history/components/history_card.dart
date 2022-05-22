import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/models/history.dart';
import 'package:shop_app/screens/history_detail/history_detail.dart';

class HistoryCard extends StatelessWidget {
  final History history;
  final bool canChangeStatus;
  final String? userId;
  const HistoryCard({Key? key, required this.history,  this.canChangeStatus=false, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);
    return ListTile(
      isThreeLine: false,
      onTap: () {
        Navigator.pushNamed(context, HistoryDetail.routeName,
            arguments: HistoryDetailArgument(history));
      },
      leading: SvgPicture.asset("assets/icons/Parcel.svg",height: 50,width: 50,),
      title: Text(
        'Purchased date: ${DateFormat('dd/MM/yyyy').format(history.purchasedTime)}',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: 'Status: ',
              style: TextStyle(
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: '${history.status ?  'DELIVERED':'DELIVERING'}',
                  style: TextStyle(
                      color: history.status ? Colors.green:Colors.red ),
                )
              ])),
        ],
      ),
      trailing: canChangeStatus?
      TextButton(child: Text('Deliver',style: TextStyle(color: Colors.green),),onPressed: (){
        if(userId!=null)
        _provider.changePurchaseStatus(userId!,history.id);
      },):Container(width: 1,),
    );
  }

  bool isDelivering() {
    return history.receiveTime.millisecondsSinceEpoch <
        DateTime.now().microsecondsSinceEpoch;
  }
}
