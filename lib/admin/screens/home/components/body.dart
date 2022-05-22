import 'package:flutter/material.dart';
import 'package:shop_app/admin/screens/all_product/admin_all_product.dart';
import 'package:shop_app/admin/screens/all_user/all_user.dart';
import 'package:shop_app/admin/screens/purchases/purchases.dart';
import 'package:shop_app/admin/screens/statistic/statistic.dart';
import 'package:shop_app/constants.dart';
import './menu_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Wrap(

          runSpacing: 20,
          spacing: 20,
          children: [
            MenuItem(
              icon: 'assets/icons/User.svg',
              title: 'All User',
              color: kPrimaryColor,
              onTap: () {
                Navigator.pushNamed(context, AllUser.routeName);
              },
            ),
            MenuItem(
              icon: 'assets/icons/Shop Icon.svg',
              title: 'All Product',
              color: kPrimaryColor,
              onTap: () {
                Navigator.pushNamed(context, AdminAllProduct.routeName);
              },
            ),
            MenuItem(
              icon: 'assets/icons/Parcel.svg',
              title: 'All Purchases',
              color: kPrimaryColor,
              onTap: () {
                Navigator.pushNamed(context, Purchases.routeName);
              },
            ),
            // MenuItem(
            //   icon: 'assets/icons/statistic_ico.svg',
            //   title: 'Statistic',
            //   color: kPrimaryColor,
            //   onTap: () {
            //     Navigator.pushNamed(context, Statistic.routeName);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
