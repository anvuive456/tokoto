import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/size_config.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          BackButton(onPressed: (){
            Navigator.of(context).pop();
          },),
          SearchField(),

        ],
      ),
    );
  }
}
