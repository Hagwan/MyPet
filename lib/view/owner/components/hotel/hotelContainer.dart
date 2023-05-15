import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/owner/components/hotel/hotelCard.dart';

import '../../../../../constants.dart';
import '../../../../../controller/owners/hotelController.dart';

HotelController _hotelController = Get.put(HotelController());

Container hotelContainer() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pet Hotels',
          style: TextStyle(
              fontFamily: fontName, fontSize: 18, color: Colors.black),
        ),
        GetBuilder<HotelController>(
            init: HotelController(),
            builder: (controller) => SingleChildScrollView(
                    child: Container(
                  height: Get.height - (prefSize + topPadding + 114),
                  child: _hotelController.showHotel
                      ? ListView.builder(
                          itemCount: _hotelController.Hotel.length,
                          itemBuilder: ((context, index) {
                            return hotelCard(index);
                          }))
                      : SizedBox(),
                ))),
      ],
    ),
  );
}
