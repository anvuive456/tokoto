import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator(
        color: kPrimaryColor,
        semanticsLabel: 'Loading...',
      ),),
    );
  }
}
