import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/admin/userController.dart';
import 'package:pets/view/admin/components/users/userCard.dart';

import '../../../../../constants.dart';

userController _userController = Get.put(userController());

Container userContainer() {
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
              'Users of the system',
              style: TextStyle(
                  fontFamily: fontName, fontSize: 18, color: Colors.black),
            ),
          ],
        ),
        GetBuilder<userController>(
            init: userController(),
            builder: (controller) => SingleChildScrollView(
                    child: Container(
                  height: Get.height - (prefSize + topPadding + 115),
                  child: _userController.showUsers
                      ? ListView.builder(
                          itemCount: _userController.users.length,
                          itemBuilder: ((context, index) {
                            return userCard(index);
                          }))
                      : SizedBox(),
                ))),
      ],
    ),
  );
}
