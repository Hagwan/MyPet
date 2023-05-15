import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/owner/profile/profile.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';
import '../owner/additions/bottomNav.dart';
import '../petCare/additions/bottomNav.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MainController _mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (mController) => Scaffold(
          backgroundColor: kSecondColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // leadingWidth: 25,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,

            actions: [
              MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => Get.to(() => ProfileScreen()),
                child: Container(
                  padding: EdgeInsets.all(7),
                  child: Image.asset(
                    _mainController.userG == 0
                        ? "assets/images/man.png"
                        : "assets/images/girl.png",
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
              color: kPrimaryColor,
              height: 90,
              child: _mainController.user_kind == 0
                  ? bottomNav()
                  : _mainController.user_kind == 1
                      ? petCareBottomNav()
                      : null),
          body: _mainController.user_kind == 0
              ? _mainController.pageContainer
              : _mainController.user_kind == 1
                  ? _mainController.pagePetCareContainer
                  : null,
        ),
      ),
    );
  }
}
