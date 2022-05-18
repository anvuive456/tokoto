import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
   SectionTitle({
    Key? key,
    required this.title,
     this.press,
  }) : super(key: key);

  final String title;
   VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        press != null?
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ):Container(),
      ],
    );
  }
}
