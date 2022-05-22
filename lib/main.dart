import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/core/app_instance.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/all_products/provider/all_product_provider.dart';
import 'package:shop_app/screens/cart/provider/cart_provider.dart';
import 'package:shop_app/screens/check_out/provider/check_out_provider.dart';
import 'package:shop_app/screens/details/provider/detail_product_provider.dart';
import 'package:shop_app/screens/edit_profile/provider/edit_profile_provider.dart';
import 'package:shop_app/screens/favourite/provider/favourite_provider.dart';
import 'package:shop_app/screens/history/provider/history_provider.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/profile/provider/profile_provider.dart';
import 'package:shop_app/screens/sign_in/provider/sign_in_provider.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  AppInstance().initData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget _getFirstScreen() {
    if (AppInstance().profileData == null)
      return SplashScreen();
    else
      return HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
          create: (context) => SignInProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
          lazy: false,
        ),

        ChangeNotifierProvider<AllProductProvider>(
          create: (context) => AllProductProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<DetailProductProvider>(
          create: (context) => DetailProductProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<FavouriteProvider>(
          create: (context) => FavouriteProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<EditProfileProvider>(
          create: (context) => EditProfileProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<CheckOutProvider>(
          create: (context) => CheckOutProvider(),
          lazy: false,
        )
        ,
        ChangeNotifierProvider<HistoryProvider>(
          create: (context) => HistoryProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) => AdminProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
        home: _getFirstScreen(),
      ),
    );
  }
}
