import 'package:flutter/material.dart';
import 'components/body.dart';

class EditProfile extends StatelessWidget {
  static String routeName = "/detailProfile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}
