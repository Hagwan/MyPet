// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

final MainController _mainController = Get.find();

GetBuilder bottomNav() {
  return GetBuilder<MainController>(
      builder: (controller) => GNav(
            backgroundColor: Colors.white,
            activeColor: kPrimaryColor,
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 18),
            gap: 3,
            tabMargin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            mainAxisAlignment: MainAxisAlignment.start,
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 19,
                text: "Home",
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.navBarSelected(0);
                },
              ),
              GButton(
                gap: 3,
                icon: Icons.pets,
                text: "Veterinary",
                iconSize: 19,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.navBarSelected(1);
                },
              ),
              GButton(
                gap: 3,
                icon: Icons.hotel,
                text: "Hotel",
                iconSize: 19,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.navBarSelected(4);
                },
              ),
              GButton(
                gap: 3,
                icon: Icons.book,
                text: "Booking",
                iconSize: 19,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.navBarSelected(2);
                },
              ),
              GButton(
                gap: 3,
                icon: Icons.tips_and_updates,
                text: "Tips",
                iconSize: 19,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.navBarSelected(7);
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
                  _mainController.navBarSelected(9);
                },
              ),
            ],
          ));
}
