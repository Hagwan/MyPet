import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/admin/components/hotel/hotelContainer.dart';

import '../../../../constants.dart';
import '../../../../controller/mainController.dart';
import '../../../controller/admin/hotelController.dart';

class HotelAdminScreen extends StatelessWidget {
  HotelAdminScreen({super.key});
  final HotelAdminController _hotelController =
      Get.put(HotelAdminController(), permanent: true);
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
                hotelAdminContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
