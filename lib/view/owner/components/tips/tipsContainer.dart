import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pets/controller/owners/tipsController.dart';

import '../../../../../constants.dart';

TipsControlller _tipsControlller = Get.put(TipsControlller());

Container tipsContainer() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pet Tips',
          style: TextStyle(
              fontFamily: fontName, fontSize: 18, color: Colors.black),
        ),
        GetBuilder<TipsControlller>(
            init: TipsControlller(),
            builder: (controller) => SingleChildScrollView(
                    child: SizedBox(
                  height: Get.height - (prefSize + topPadding + 114),
                  child: ListView.builder(
                      itemCount: _tipsControlller.FactList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width,
                          height: 200,
                          child: Stack(children: [
                            Positioned(
                              top: 40,
                              child: Container(
                                width: Get.width - 40,
                                padding: EdgeInsets.only(
                                    top: 60,
                                    left: kDefaultPadding / 2,
                                    right: kDefaultPadding / 2),
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: .7, color: kPrimaryColor)),
                                child: Text(
                                  '${_tipsControlller.FactList[index].fact}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: fontName,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Positioned(
                                right: (Get.width - (80 + kDefaultPadding)) / 2,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: kSecondColor,
                                    border: Border.all(
                                        width: .7, color: kPrimaryColor),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child:
                                          Image.asset("assets/images/tip.png")),
                                )),
                          ]),
                        );
                      }),
                ))),
      ],
    ),
  );
}
