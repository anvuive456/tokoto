import 'package:flutter/material.dart';
import './components/body.dart';

class Purchases extends StatelessWidget {
  static String routeName = '/purchases';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Purchases',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
