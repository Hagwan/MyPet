import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../../../../../controller/owners/homeController.dart';

final HomeController _homeController = Get.find();
Container createTwo() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + 115),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Choose your pet',
          style: TextStyle(
              fontFamily: fontName, fontSize: 25, color: kPrimaryColor),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              height: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () => _homeController.selectPet(0),
              child: Container(
                width: 130,
                height: 150,
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                decoration: BoxDecoration(
                    color: kThirdColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Image.asset(
                    'assets/images/cat.png',
                  ),
                ),
              ),
            ),
            MaterialButton(
              height: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: const EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () => _homeController.selectPet(1),
              child: Container(
                width: 130,
                height: 150,
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                decoration: BoxDecoration(
                    color: kThirdColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Image.asset(
                    'assets/images/dog.png',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        _homeController.showBackBTN
            ? MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => _homeController.backFromCreate(2),
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
  );
}
