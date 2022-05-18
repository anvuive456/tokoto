import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/profile_data.dart';

class AppInstance {
  static final AppInstance _singleton = AppInstance._internal();

  factory AppInstance() {
    return _singleton;
  }

  AppInstance._internal();

  ProfileData? profileData;

  List<Cart> carts = [];

  void saveProfile(ProfileData profileData) async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('PROFILE', profileData.toJson().toString());
  }

  void getProfile() async {
    var sharedPref = await SharedPreferences.getInstance();
    if (sharedPref.getString('PROFILE') != null)
      profileData =
          ProfileData.fromJson(jsonDecode(sharedPref.getString('PROFILE')!));
  }

  void removeProfile() async {
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove('PROFILE');
    profileData = null;
  }


  void initData(){
    getProfile();
  }
}
