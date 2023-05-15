import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/bookingController.dart';

import '../../../../../constants.dart';

final BookingControler _bookingControler = Get.find();

Container bookingCard(index) {
  return Container(
    width: Get.width - 20,
    height: 195,
    margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
    padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding, vertical: kDefaultPadding),
    decoration: BoxDecoration(
      color: kSecondColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black, width: .6),
      boxShadow: [
        BoxShadow(
          offset: Offset(1, 1),
          blurRadius: 5,
          spreadRadius: .5,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black, width: .3),
              ),
              child: Image.network(
                _bookingControler.bookingList[index]['image'],
                width: 95,
                height: 95,
              ),
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _bookingControler.bookingList[index]['name'],
                    style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: kPrimaryColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          _bookingControler.bookingList[index]['address'],
                          style: TextStyle(
                              fontFamily: fontName,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking: ${_bookingControler.bookingList[index]['dateDay']}',
                  style: TextStyle(
                      fontFamily: fontName, fontSize: 13, color: kPrimaryColor),
                ),
                Text(
                  'Time: ${_bookingControler.bookingList[index]['dateTime']} - ${_bookingControler.bookingList[index]['dateTimeTo']}',
                  style: TextStyle(
                      fontFamily: fontName, fontSize: 13, color: kPrimaryColor),
                ),
              ],
            ),
            Text(
              'Status: ${_bookingControler.bookingList[index]['confirm'] == 0 ? 'Not confirmed' : 'Confirmed'}',
              style: TextStyle(
                  fontFamily: fontName, fontSize: 13, color: kPrimaryColor),
            ),
          ],
        )
      ],
    ),
  );
}
