import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_app_fackdata/view/screens/cart_screen.dart';
import 'package:shop_app_fackdata/view/screens/details_screen.dart';
import 'package:shop_app_fackdata/view/screens/home_screen.dart';
import 'package:shop_app_fackdata/view/screens/on_bording_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: OnBordingScreen.routName,
      getPages: [
        GetPage(
            name: OnBordingScreen.routName,
            page: () => OnBordingScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
            name: HomeScreen.routName,
            page: () => HomeScreen(),
            transition: Transition.cupertino,
        ),
        GetPage(
          name: DetailsScreen.routName,
          page: () => DetailsScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: CartScreen.routName,
          page: () => CartScreen(),
          transition: Transition.cupertino,
        ),
      ],
    );
  }
}
