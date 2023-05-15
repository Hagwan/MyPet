import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/petController.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';
import '../components/petCare/petContainer.dart';

class petScreen extends StatelessWidget {
  petScreen({super.key});
  final PetController _petController =
      Get.put(PetController(), permanent: true);
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
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                petContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
