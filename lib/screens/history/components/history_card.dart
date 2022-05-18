import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/history.dart';
import 'package:shop_app/screens/history_detail/history_detail.dart';

class HistoryCard extends StatelessWidget {
  final History history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: false,
      onTap: () {
        Navigator.pushNamed(context, HistoryDetail.routeName,
            arguments: HistoryDetailArgument(history));
      },
      leading: SvgPicture.asset("assets/icons/receipt.svg"),
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
                  text: '${isDelivering() ? 'DELIVERING' : 'DELIVERED'}',
                  style: TextStyle(
                      color: isDelivering() ? Colors.red : Colors.green),
                )
              ])),
        ],
      ),
    );
  }

  bool isDelivering() {
    return history.receiveTime.millisecondsSinceEpoch <
        DateTime.now().microsecondsSinceEpoch;
  }
}
