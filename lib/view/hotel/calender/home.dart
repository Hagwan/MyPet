import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';
import '../../../controller/hotel/calController.dart';
import '../components/calender/home.dart';

class HomeHotelCalender extends StatelessWidget {
  HomeHotelCalender({super.key});
  final CalenderController _calenderController = Get.put(CalenderController());
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (Controller) => Scaffold(
          body: GetBuilder<CalenderController>(
            builder: (controller) => Container(
              height: Get.height,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: calenderHome(),
            ),
          ),
        ),
      ),
    );
  }
}
