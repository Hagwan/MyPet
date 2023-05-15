import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/petController.dart';

import '../../../../constants.dart';
import '../../../../controller/mainController.dart';
import '../components/hotel/hotelCareBookingContainer.dart';

class HotelPetCareScreen extends StatelessWidget {
  const HotelPetCareScreen({super.key});

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
            child: GetBuilder<PetController>(
                init: PetController(),
                builder: (mController) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [hotelCareBookingContainer()],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
