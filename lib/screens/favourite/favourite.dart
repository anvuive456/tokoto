import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'components/body.dart';

class Favourite extends StatelessWidget {
  static String routeName='/favourite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
