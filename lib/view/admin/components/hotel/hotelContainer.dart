import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/admin/components/hotel/hotelCard.dart';

import '../../../../../constants.dart';
import '../../../../controller/admin/hotelController.dart';
import '../../hotel/addHotel.dart';

HotelAdminController _hotelController = Get.put(HotelAdminController());

Container hotelAdminContainer() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pet Hotels',
              style: TextStyle(
                  fontFamily: fontName, fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => Get.to(() => AddHotelScreen()),
                child: Text(
                  '+',
                  style: TextStyle(
                      fontFamily: fontName, fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        GetBuilder<HotelAdminController>(
            init: HotelAdminController(),
            builder: (controller) => SingleChildScrollView(
                    child: Container(
                  height: Get.height - (prefSize + topPadding + 115),
                  child: _hotelController.showHotel
                      ? ListView.builder(
                          itemCount: _hotelController.Hotel.length,
                          itemBuilder: ((context, index) {
                            return hotelAdminCard(index);
                          }))
                      : SizedBox(),
                ))),
      ],
    ),
  );
}
