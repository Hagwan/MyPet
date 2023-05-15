import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

import '../components/petCare/petCareBookingContainer.dart';

class BookingPetCareScreen extends StatelessWidget {
  BookingPetCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        init: MainController(),
        builder: (mController) => Scaffold(
          backgroundColor: kSecondColor,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [petCareBookingContainer()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
