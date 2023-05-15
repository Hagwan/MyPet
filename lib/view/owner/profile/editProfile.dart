// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/profileController.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  ProfileController _profileController = Get.find();

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
                'Edit Profile',
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
                    'Edit Profile',
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
                    key: _profileController.formKey,
                    child: GetBuilder<ProfileController>(
                        builder: (mController) => Container(
                              width: Get.width * .75,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller:
                                        _profileController.fNameController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "tajawal",
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
                                          fontFamily: "tajawal",
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
                                        _profileController.lNameController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "tajawal",
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
                                          fontFamily: "tajawal",
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
                                        _profileController.addressController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "tajawal",
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
                                          fontFamily: "tajawal",
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
                                        _profileController.phoneController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "tajawal",
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
                                        hintText: 'Phone Number',
                                        hintStyle: const TextStyle(
                                          height: 2,
                                          fontFamily: "tajawal",
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
                                    controller: _profileController
                                        .emailSignUpController,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "tajawal",
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
                                        hintText: 'Email',
                                        hintStyle: const TextStyle(
                                          height: 2,
                                          fontFamily: "tajawal",
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
                                        groupValue: _profileController.gender,
                                        onChanged: ((value) =>
                                            _profileController.RadioChanged(
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
                                        groupValue: _profileController.gender,
                                        onChanged: ((value) =>
                                            _profileController.RadioChanged(
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
                                    height: kDefaultPadding * 3,
                                  ),
                                  MaterialButton(
                                    height: 0,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    padding: const EdgeInsets.all(0),
                                    minWidth: 0,
                                    onPressed: () =>
                                        _profileController.updateUserData(),
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
                                        'Save',
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
