import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/authcontroller.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

class SignScreen extends StatelessWidget {
  SignScreen({super.key});
  AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (mController) => Scaffold(
          backgroundColor: kSecondColor,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: topPadding,
                  ),
                  MaterialButton(
                    height: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.all(0),
                    minWidth: 0,
                    onPressed: () => Get.back(),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'SignUp',
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
                    child: GetBuilder<AuthController>(
                        builder: (mController) => Container(
                              width: Get.width * .75,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _authController.fNameController,
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
                                    controller: _authController.lNameController,
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
                                        _authController.addressController,
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
                                    controller: _authController.phoneController,
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
                                    controller:
                                        _authController.emailSignUpController,
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
                                  TextFormField(
                                    controller:
                                        _authController.passSignUpController,
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
                                    obscureText: true,
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
                                        hintText: 'Password',
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
                                        groupValue: _authController.gender,
                                        onChanged: ((value) =>
                                            _authController.RadioChanged(
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
                                        groupValue: _authController.gender,
                                        onChanged: ((value) =>
                                            _authController.RadioChanged(
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
                                    onPressed: () => _authController.signUp(),
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
                                        'Create account',
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
