import 'package:get/get.dart';

import '../model/home_model.dart';

class CartController extends GetxController{
  ProductData argumentData = Get.arguments[0];
  List<ProductData> cartData = Get.arguments[1];
}