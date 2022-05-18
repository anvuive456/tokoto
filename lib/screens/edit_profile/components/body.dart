import 'package:flutter/material.dart';
import 'package:shop_app/screens/edit_profile/components/profile_field.dart';
import 'package:shop_app/screens/edit_profile/edit_profile.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            EditProfileForm()
          ],
        ),
      ),
    );
  }
}
