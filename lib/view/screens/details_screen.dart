import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_fackdata/controller/details_controller.dart';
import 'package:shop_app_fackdata/controller/home_controller.dart';
import 'package:shop_app_fackdata/model/home_model.dart';

class DetailsScreen extends StatelessWidget {
  static String routName = '/detailsScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: double.infinity,
                    child: Image.asset(
                        'assets/images/${controller.argumentData.image}'),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.argumentData.subTitle}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              letterSpacing: 1.5),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${controller.argumentData.title}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              height: 50,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey.shade600, width: 2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.remove),
                                  Text('0'),
                                  Icon(Icons.add),
                                ],
                              ),
                            ),
                            Text(
                              '\$ ${controller.argumentData.price}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        /// Discraption
                        Text(
                          '${controller.argumentData.description}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Volume: 60 ml',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// add to cart button
                  addToCartButton(context, controller),
                  addToFavButton(context,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// add to cart widget
  Widget addToCartButton(context, DetailsController controller) =>
      GestureDetector(
        onTap: () {
          controller.addToCartFunction();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Add To Cart',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );

  /// fav widget
  Widget addToFavButton(
    context,
  ) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.favorite_border,
          ),
        ),
      );
}
