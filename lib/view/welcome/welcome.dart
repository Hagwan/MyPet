import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/constants.dart';

import '../../controller/mainController.dart';
import '../owner/auth/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (mController) => Scaffold(
          backgroundColor: kPrimaryColor,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/cat.png",
                  width: 200,
                  height: 200,
                ),
                Text(
                  'MyPet',
                  style: TextStyle(
                      fontFamily: fontName, fontSize: 45, color: Colors.white),
                ),
                SizedBox(
                  height: kDefaultPadding * 5,
                ),
                MaterialButton(
                  height: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                  onPressed: () => Get.to(() => LoginScreen()),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 3, left: 30, right: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 30,
                          color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
