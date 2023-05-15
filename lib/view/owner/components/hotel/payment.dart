import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pets/controller/mainController.dart';
import 'package:pets/controller/owners/hotelController.dart';

import '../../../../constants.dart';

final HotelController _hotelController = Get.find();
final MainController _mainController = Get.find();

Container PaymentHotelContainer() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: GetBuilder<HotelController>(
      init: HotelController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
              height: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () => _mainController.navBarSelected(4),
              child: Container(width: 30, child: Icon(Icons.arrow_back_ios))),
          SizedBox(
            width: Get.width,
            child: Text(
              'Payment',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: fontName, fontSize: 25, color: Colors.black),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Divider(
            thickness: .5,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          TextFormField(
            controller: _hotelController.cardNumController,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: fontName,
              height: 2,
            ),
            cursorHeight: 27,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                //

                hintText: 'Card Number',
                hintStyle: const TextStyle(
                  height: 2,
                  fontFamily: fontName,
                  fontSize: 16,
                  color: Color(0xffA9A9A9),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.only(top: 0, right: 10, left: 10)),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * .6,
                child: TextFormField(
                  controller: _hotelController.expiredNumController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: fontName,
                    height: 2,
                  ),
                  cursorHeight: 27,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      //

                      hintText: 'Expired Date',
                      hintStyle: const TextStyle(
                        height: 2,
                        fontFamily: fontName,
                        fontSize: 16,
                        color: Color(0xffA9A9A9),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(top: 0, right: 10, left: 10)),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                width: Get.width * .25,
                child: TextFormField(
                  controller: _hotelController.cvvController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: fontName,
                    height: 2,
                  ),
                  cursorHeight: 27,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      //

                      hintText: 'CVV',
                      hintStyle: const TextStyle(
                        height: 2,
                        fontFamily: fontName,
                        fontSize: 16,
                        color: Color(0xffA9A9A9),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(top: 0, right: 10, left: 10)),
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          MaterialButton(
            height: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
            minWidth: 0,
            onPressed: () => _hotelController.saveBooking(),
            child: Container(
              width: Get.width,
              padding: EdgeInsets.only(
                top: 13,
                bottom: 6,
              ),
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(7)),
              child: Text(
                'Booking',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: fontName, fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
