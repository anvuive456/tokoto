import 'package:flutter/widgets.dart';
import 'package:shop_app/admin/screens/add_product/add_product.dart';
import 'package:shop_app/admin/screens/all_product/admin_all_product.dart';
import 'package:shop_app/admin/screens/all_user/all_user.dart';
import 'package:shop_app/admin/screens/detail_product/detail_product.dart';
import 'package:shop_app/admin/screens/detail_purchase/detail_purchase.dart';
import 'package:shop_app/admin/screens/home/admin_home.dart';
import 'package:shop_app/admin/screens/purchases/purchases.dart';
import 'package:shop_app/admin/screens/statistic/statistic.dart';
import 'package:shop_app/screens/all_products/all_products.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/check_out/check_out.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/edit_profile/edit_profile.dart';
import 'package:shop_app/screens/favourite/favourite.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/history/history.dart';
import 'package:shop_app/screens/history_detail/history_detail.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/popular/popular.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/search/search.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  EditProfile.routeName:(context) => EditProfile(),
  AllProductsScreen.routeName:(context)=> AllProductsScreen(),
  Favourite.routeName:(context)=> Favourite(),
  Search.routeName:(context) =>Search(),
  Popular.routeName:(context)=>Popular(),
  CheckOut.routeName:(context)=>CheckOut(),
  HistoryScreen.routeName:(context)=>HistoryScreen(),
  HistoryDetail.routeName:(context)=>HistoryDetail(),
  AdminHome.routeName:(context)=>AdminHome(),
  AdminAllProduct.routeName:(context)=>AdminAllProduct(),
  DetailProduct.routeName:(context)=>DetailProduct(),
  Purchases.routeName:(context)=>Purchases(),
  AllUser.routeName:(context)=>AllUser(),
  DetailPurchase.routeName:(context)=>DetailPurchase(),
  Statistic.routeName:(context)=>Statistic(),
  AddProduct.routeName:(context)=>AddProduct()
};
