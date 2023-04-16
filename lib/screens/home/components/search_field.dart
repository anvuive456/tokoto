import 'package:flutter/material.dart';
import 'package:shop_app/screens/search/search.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Search.routeName),
        child: TextField(
          enabled: false,

          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search product",
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
