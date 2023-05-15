// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pets/controller/admin/userController.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

class UserEditScreen extends StatelessWidget {
  UserEditScreen({super.key});

  userController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (mController) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // leadingWidth: 25,
            elevation: 0.0,
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                'Edit User',
                style: TextStyle(fontFamily: fontName, fontSize: 20),
              ),
            ),
            leading: MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          backgroundColor: kSecondColor,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(
                    'Edit User',
                    style: TextStyle(
                      fontFamily: fontName,
                      fontSize: 30,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Form(
                    key: _userController.formKey,
                    child: GetBuilder<userController>(
                        builder: (mController) => Container(
                              width: Get.width * .75,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller:
                                        _userController.firstNameEditController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontName,
                                      height: 2,
                                    ),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'This field cannot be left blank';
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorHeight: 27,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        //
                                        hintText: 'First Name',
                                        hintStyle: const TextStyle(
                                          height: 2,
                                          fontFamily: fontName,
                                          fontSize: 16,
                                          color: Color(0xffA9A9A9),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            top: 0, right: 10, left: 10)),
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  TextFormField(
                                    controller:
                                        _userController.lastNameEditController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontName,
                                      height: 2,
                                    ),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'This field cannot be left blank';
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorHeight: 27,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        //
                                        hintText: 'Last Name',
                                        hintStyle: const TextStyle(
                                          height: 2,
                                          fontFamily: fontName,
                                          fontSize: 16,
                                          color: Color(0xffA9A9A9),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            top: 0, right: 10, left: 10)),
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  TextFormField(
                                    controller: _userController
                                        .addressNameEditController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontName,
                                      height: 2,
                                    ),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'This field cannot be left blank';
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorHeight: 27,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        //
                                        hintText: 'Address',
                                        hintStyle: const TextStyle(
                                          height: 2,
                                          fontFamily: fontName,
                                          fontSize: 16,
                                          color: Color(0xffA9A9A9),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            top: 0, right: 10, left: 10)),
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Gender: ',
                                        style: TextStyle(
                                            fontFamily: fontName, fontSize: 16),
                                      ),
                                      Radio<Gender>(
                                        value: Gender.male,
                                        groupValue: _userController.gender,
                                        onChanged: ((value) =>
                                            _userController.RadioChanged(
                                                value)),
                                      ),
                                      Text(
                                        'Male',
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 16,
                                            height: 2),
                                      ),
                                      SizedBox(
                                        width: kDefaultPadding,
                                      ),
                                      Radio<Gender>(
                                        value: Gender.female,
                                        groupValue: _userController.gender,
                                        onChanged: ((value) =>
                                            _userController.RadioChanged(
                                                value)),
                                      ),
                                      Text(
                                        'Female',
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 16,
                                            height: 2),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  TextFormField(
                                    controller:
                                        _userController.phoneNameEditController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontName,
                                      height: 2,
                                    ),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'This field cannot be left blank';
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorHeight: 27,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                        ),
                                        //
                                        hintText: 'Phone',
                                        hintStyle: const TextStyle(
                                          height: 2,
                                          fontFamily: fontName,
                                          fontSize: 16,
                                          color: Color(0xffA9A9A9),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            top: 0, right: 10, left: 10)),
                                    keyboardType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Kind: ',
                                        style: TextStyle(
                                            fontFamily: fontName, fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 30,
                                        child: Radio<Kind>(
                                          value: Kind.Owner,
                                          groupValue: _userController.kind,
                                          onChanged: ((value) =>
                                              _userController.RadioKindChanged(
                                                  value)),
                                        ),
                                      ),
                                      Text(
                                        'Owner',
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 14,
                                            height: 2),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 30,
                                        child: Radio<Kind>(
                                          value: Kind.PetCare,
                                          groupValue: _userController.kind,
                                          onChanged: ((value) =>
                                              _userController.RadioKindChanged(
                                                  value)),
                                        ),
                                      ),
                                      Text(
                                        'PetCare',
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 14,
                                            height: 2),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 30,
                                        child: Radio<Kind>(
                                          value: Kind.Hotel,
                                          groupValue: _userController.kind,
                                          onChanged: ((value) =>
                                              _userController.RadioKindChanged(
                                                  value)),
                                        ),
                                      ),
                                      Text(
                                        'Hotel',
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 14,
                                            height: 2),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding,
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
                                    onPressed: () =>
                                        _userController.editUserCare(),
                                    child: Container(
                                      width: Get.width,
                                      padding: EdgeInsets.only(
                                        top: 13,
                                        bottom: 6,
                                      ),
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Text(
                                        'save',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 17,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
