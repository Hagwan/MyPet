import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/bookingController.dart';

import '../../../../../constants.dart';
import 'bookingCard.dart';

final BookingControler _bookingControler = Get.find();

Container bookingContainer() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'View bookings',
          style: TextStyle(
              fontFamily: fontName, fontSize: 18, color: Colors.black),
        ),
        Container(
          height: Get.height - (prefSize + topPadding + 114),
          child: GetBuilder<BookingControler>(
              builder: (controller) => _bookingControler.showBooking
                  ? RefreshIndicator(
                      onRefresh: () => _bookingControler.getBooking(),
                      child: ListView.builder(
                        itemCount: _bookingControler.bookingList.length,
                        itemBuilder: (context, index) {
                          if (_bookingControler.bookingList.length > 0) {
                            return bookingCard(index);
                          } else {
                            return SizedBox(
                              child: Text(
                                'No booking for today',
                                style: TextStyle(
                                    fontFamily: fontName,
                                    color: Colors.grey.withOpacity(.6),
                                    fontSize: 20),
                              ),
                            );
                          }
                        },
                      ),
                    )
                  : SizedBox()),
        ),
      ],
    ),
  );
}
