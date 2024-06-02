import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shop_app_fackdata/controller/home_controller.dart';
import 'package:shop_app_fackdata/model/home_model.dart';
import 'package:shop_app_fackdata/view/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? myController;

  @override
  void initState() {
    myController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoding?Center(child: CircularProgressIndicator()) :SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'It\'s a Great Day for Coffee',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      /// searsh filed
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Find Your Coffee',
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      ///TabBar
                      TabBar(
                        controller: myController,
                        dividerHeight: 0,
                        labelColor: Colors.orange,
                        indicatorColor: Colors.orange,
                        labelStyle: TextStyle(fontSize: 17),
                        tabs: [
                          Text('Hot Coffee'),
                          Text('Cold Coffee'),
                          Text('Cappuiccino'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1 / 1.4),
                        children: List.generate(
                          controller.dataList!.length,
                              (index) {
                            ProductData product = controller.dataList![index];
                            return gridItem(controller.dataList![index] , controller , product);
                              },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items:[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: 0,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          );
        },
    );
  }

  Widget gridItem(ProductData model, HomeController countroller , ProductData detileProduct) => GestureDetector(
    onTap: () {
      countroller.onClickItemHomeScreen(detileProduct);
      // var ProdecId = model.id;
    },
    child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 70, 70, 70),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                    height: 110,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Image.asset('assets/images/${model.image}',)),
                Text(
                  '${model.title}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${model.subTitle}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${model.price}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        countroller.addToCartHomeBtn(model.id);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.orange,
                        child: Icon(
                          countroller.isCartProduct(model.id) ? Icons.done :Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
  );
}
