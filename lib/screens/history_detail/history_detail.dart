import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/history.dart';
import 'package:shop_app/screens/cart/components/cart_card.dart';
import 'package:shop_app/screens/details/details_screen.dart';

class HistoryDetail extends StatelessWidget {
  static String routeName = '/historyDetail';

  @override
  Widget build(BuildContext context) {
    final HistoryDetailArgument agrs =
        ModalRoute.of(context)!.settings.arguments as HistoryDetailArgument;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail History',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'You bought in: ${DateFormat('dd/MM/yyyy').format(agrs.history.purchasedTime)}'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'You will receive in: ${DateFormat('dd/MM/yyyy').format(agrs.history.receiveTime)}'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Item in your cart:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: agrs.history.carts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: agrs.history.carts[index].product));
                      },
                      child: CartCard(
                        cart: agrs.history.carts[index],
                        haveCount: false,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class HistoryDetailArgument {
  History history;

  HistoryDetailArgument(this.history);
}
