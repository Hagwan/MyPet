// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

final MainController _mainController = Get.find();

GetBuilder bottomAdminNav() {
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
                iconSize: 23,
                text: "Home",
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.user_kind == 0
                      ? _mainController.navBarSelected(0)
                      : _mainController.user_kind == 1
                          ? null
                          : _mainController.user_kind == 2
                              ? null
                              : _mainController.navBarAdminSelected(0);
                },
              ),
              GButton(
                gap: 5,
                icon: Icons.pets,
                text: "Veterinarian",
                iconSize: 23,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.user_kind == 0
                      ? _mainController.navBarSelected(1)
                      : _mainController.user_kind == 1
                          ? null
                          : _mainController.user_kind == 2
                              ? null
                              : _mainController.navBarAdminSelected(1);
                },
              ),
              GButton(
                gap: 5,
                icon: Icons.hotel,
                text: "Pet Hotel",
                iconSize: 23,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.user_kind == 0
                      ? _mainController.navBarSelected(4)
                      : _mainController.user_kind == 1
                          ? null
                          : _mainController.user_kind == 2
                              ? null
                              : _mainController.navBarAdminSelected(4);
                },
              ),
              GButton(
                gap: 5,
                icon: Icons.manage_accounts,
                text: "Users",
                iconSize: 23,
                textStyle: const TextStyle(
                    fontFamily: fontName,
                    color: kPrimaryColor,
                    height: 1.7,
                    fontSize: 13),
                onPressed: () {
                  _mainController.user_kind == 0
                      ? _mainController.navBarSelected(4)
                      : _mainController.user_kind == 1
                          ? null
                          : _mainController.user_kind == 2
                              ? null
                              : _mainController.navBarAdminSelected(3);
                },
              ),
            ],
          ));
}
