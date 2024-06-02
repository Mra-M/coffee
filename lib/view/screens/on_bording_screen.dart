import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_fackdata/view/screens/home_screen.dart';

class OnBordingScreen extends StatelessWidget {
  static String routName = '/onBordingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          opacity: 0.9,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Coffee shop',
                style: GoogleFonts.fugazOne(
                  color: Colors.white,
                  fontSize: 45,
                ),
              ),
            ),
            Spacer(),
            Text(
              'Feeling Low? Take a Sip of cpffee',
              style: GoogleFonts.abel(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            myButton(),
            SizedBox(
              height: 30,
            ),

          ],
        ),
      )),
    );
  }
  Widget myButton()=>GestureDetector(
    onTap: () {
      Get.offNamed(HomeScreen.routName);
    },
    child: Container(
      width: 170,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text('Get Start' , style: TextStyle(color: Colors.white , fontSize: 22, fontWeight: FontWeight.bold),),
      ),
    ),
  );
}
