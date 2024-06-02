import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';
import '../view/screens/details_screen.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    getData();
    super.onInit();
  }


  bool isLoding = true;
  List<ProductData>? dataList= [];
  Future<void> getData()async{
    try {
      isLoding = true;
      final data = await rootBundle.loadString('assets/data.json');
      var jsonData = await jsonDecode(data) as List;
      dataList = jsonData.map((e) => ProductData.fromJson(e),).toList();
      isLoding = false;
    }catch(error){
      isLoding = true;
      print(error.toString());
    }
    isLoding = false;
    update();
  }

  /// onClickItemHomeScareen
  void onClickItemHomeScreen(ProductData model){
    Get.toNamed(DetailsScreen.routName, arguments: [model , cartData]);
  }

  List<ProductData> cartData = [];
  void setFavoriteMeals(int elemantId) {
    final existingIndex = cartData.indexWhere((elemant) => elemant.id == elemantId);
    if (existingIndex >= 0) {
    cartData.removeAt(existingIndex);
    } else {
    cartData.add(dataList!.firstWhere((meal) => meal.id == elemantId));
    }
    update();
  }

  IconData addIcon = Icons.add;
  bool isCartProduct(int id) {
    if (cartData.any((meal) => meal.id == id)) {
      return true;
    }
    return false;
  }
  void addToCartHomeBtn(int id){
    setFavoriteMeals(id);
    update();
    print('added');
    print(cartData.length);
  }



}