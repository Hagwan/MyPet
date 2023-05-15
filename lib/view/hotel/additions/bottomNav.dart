// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

final MainController _mainController = Get.find();

GetBuilder HotelBottomNav() {
  return GetBuilder<MainController>(
      builder: (controller) => GNav(
            backgroundColor: Colors.white,
            activeColor: kPrimaryColor,
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            gap: 4,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                iconSize: 26,
                text: "Home",
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 14),
                onPressed: () {
                  _mainController.navBarHotelSelected(0);
                },
              ),
              GButton(
                gap: 5,
                icon: Icons.calendar_month_outlined,
                text: "Calender",
                iconSize: 26,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 14),
                onPressed: () {
                  _mainController.navBarHotelSelected(1);
                },
              ),
              GButton(
                gap: 3,
                icon: Icons.chat,
                text: "Chat",
                iconSize: 19,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.navBarHotelSelected(3);
                },
              ),
              GButton(
                gap: 5,
                icon: Icons.account_circle,
                text: "Profile",
                iconSize: 26,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 14),
                onPressed: () {
                  _mainController.navBarHotelSelected(2);
                },
              ),
            ],
          ));
}
