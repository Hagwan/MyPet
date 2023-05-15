import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/admin/userController.dart';
import 'package:pets/controller/mainController.dart';

import '../../../../../constants.dart';

userController _userController = Get.put(userController());
MainController _mainController = Get.find();

Container userCard(index) {
  return Container(
    width: Get.width - 50,
    height: 150,
    margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
    padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
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
    child: Row(
      children: [
        Container(
          //   padding: EdgeInsets.all(8),
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            border: Border.all(color: Colors.black, width: .6),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: _userController.users[index]['gender'] == 0
                ? Image.asset(
                    "assets/images/man.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "assets/images/girl.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        Container(
          margin: EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _userController.users[index]['firstName'] +
                    " " +
                    _userController.users[index]['lastName'],
                style: TextStyle(
                    fontFamily: fontName, fontSize: 20, color: Colors.black),
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
                      _userController.users[index]['address'],
                      style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Container(
                width: Get.width - 195,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      height: 0,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: const EdgeInsets.all(0),
                      minWidth: 0,
                      onPressed: () => _userController.prepareEditUser(index),
                      child: Container(
                        margin: EdgeInsets.zero,
                        height: 30,
                        padding: EdgeInsets.only(left: 15, right: 15, top: 6.5),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: fontName,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
