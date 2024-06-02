import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_fackdata/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  static String routName = '/cartScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child:ListView.separated(itemBuilder: (context, index) => itemBuilder(controller, index), separatorBuilder: (context , index)=>SizedBox(height: 10,), itemCount: controller.cartData.length)

            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                margin:
                    EdgeInsets.only(bottom: 15, right: 16, left: 16, top: 10),
                decoration: BoxDecoration(
                  // color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                    child: Text(
                  'By Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget itemBuilder(CartController controller , int index) =>Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: double.infinity,
    height: 110,
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 120,
          height: 150,
          child: Image.asset(
            'assets/images/${controller.cartData[index].image}',
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${controller.cartData[index].title}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${controller.cartData[index].subTitle}',
              overflow: TextOverflow.ellipsis,
              style:
              TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        Spacer(),
        Text(
          '\$ ${controller.cartData[index].price}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ],
    ),
  );

}
