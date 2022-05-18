import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/sign_in/provider/sign_in_provider.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
