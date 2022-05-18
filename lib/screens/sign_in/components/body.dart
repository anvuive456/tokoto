import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/screens/sign_in/provider/sign_in_provider.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SignInProvider>(context);
    return SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     // SocalCard(
                //     //   icon: "assets/icons/facebook-2.svg",
                //     //   press: () {},
                //     // ),
                //     // SocalCard(
                //     //   icon: "assets/icons/twitter.svg",
                //     //   press: () {},
                //     // ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
