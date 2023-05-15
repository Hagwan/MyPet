import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/mainController.dart';
import 'package:pets/controller/owners/homeController.dart';

import '../../../../../constants.dart';

final HomeController _homeController = Get.find();
final MainController _mainController = Get.find();
Container createOne() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + 115),
    child: MaterialButton(
      height: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
      minWidth: 0,
      onPressed: () => _homeController.changePetPages(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create pet profile',
            style: TextStyle(
                fontFamily: fontName, fontSize: 25, color: kPrimaryColor),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
                color: kThirdColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(color: kPrimaryColor, fontSize: 60),
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          _homeController.showBackBTN
              ? MaterialButton(
                  height: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                  onPressed: () => _homeController.backFromCreate(1),
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.only(
                      top: 13,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    ),
  );
}
