import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/tipsController.dart';

import '../../../../constants.dart';
import '../../../../controller/mainController.dart';

import '../components/tips/tipsContainer.dart';

class TipsScreen extends StatelessWidget {
  TipsScreen({super.key});
  final TipsControlller _tipsControlller =
      Get.put(TipsControlller(), permanent: true);
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
              children: [tipsContainer()],
            ),
          ),
        ),
      ),
    );
  }
}
