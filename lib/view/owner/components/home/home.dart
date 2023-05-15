import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/owner/components/home/createThree.dart';
import 'package:pets/view/owner/components/home/createTwo.dart';
import 'package:pets/view/owner/components/home/pets.dart';

import '../../../../../constants.dart';
import '../../../../../controller/mainController.dart';
import '../../../../../controller/owners/homeController.dart';
import 'createOne.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final HomeController _homeController = Get.put(HomeController());

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
          body: GetBuilder<HomeController>(
              builder: (mController) => Container(
                    height: Get.height - (prefSize + 115),
                    width: Get.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _homeController.havePets
                              ? pets()
                              : _homeController.petPage == 1
                                  ? createOne()
                                  : _homeController.petPage == 2
                                      ? createTwo()
                                      : createThree()
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
