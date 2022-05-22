import 'package:flutter/material.dart';
import './components/body.dart';
class AllUser extends StatelessWidget {
  static String routeName ='/allUser';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All User',style: TextStyle(color: Colors.black),),
      ),
      body: Body(),);
  }
}
