import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/profile/provider/profile_provider.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'components/body.dart';

class AdminHome extends StatelessWidget {
  static String routeName = '/adminHome';

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ProfileProvider>(context);
    return WillPopScope(
      onWillPop: ()async { return false; },
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text(
              'Tokoto',
              style: TextStyle(color: kPrimaryColor),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _provider.logout().whenComplete(() =>
                        Navigator.popAndPushNamed(
                            context, SignInScreen.routeName));
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          body: Body()),
    );
  }
}
