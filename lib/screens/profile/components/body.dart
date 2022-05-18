import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_profile/edit_profile.dart';
import 'package:shop_app/screens/profile/provider/profile_provider.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ProfileProvider>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, EditProfile.routeName)
            },
          ),
          // ProfileMenu(
          //   text: "Notifications",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "Help Center",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              _provider.logout().whenComplete(() {
                Navigator.popAndPushNamed(context, SplashScreen.routeName);
                // Navigator.popUntil(
                //   context, ModalRoute.withName(SignInScreen.routeName));
              });
            },
          ),
        ],
      ),
    );
  }
}
