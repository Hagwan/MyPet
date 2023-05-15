import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/homeController.dart';

import '../../../../../constants.dart';

final HomeController _homeController = Get.find();

Column createThree() {
  return Column(
    children: [
      Text(
        'Enter your pet details',
        style:
            TextStyle(fontFamily: fontName, fontSize: 18, color: kPrimaryColor),
      ),
      SizedBox(
        height: kDefaultPadding,
      ),
      Image.asset(
        "assets/icons/catCircle.png",
        width: 70,
      ),
      SizedBox(
        height: kDefaultPadding,
      ),
      Form(
        key: _homeController.formKey,
        child: Container(
          width: Get.width * .75,
          child: Column(
            children: [
              TextFormField(
                controller: _homeController.nameController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Pet Name',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.genderController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Gender',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.birthController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Date of birth',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.breedController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Breed',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.colorController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Color',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.weightController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Weight (kg)',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.vaccinationController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Vaccination info',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.microshipController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Microship number',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.passportController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Pet passport number',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.spayController,
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
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Spay / Neuter status',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFormField(
                controller: _homeController.noteController,
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
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    //
                    hintText: 'Note',
                    hintStyle: const TextStyle(
                      height: 2,
                      fontFamily: fontName,
                      fontSize: 16,
                      color: Color(0xffA9A9A9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.only(top: 0, right: 10, left: 10)),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                children: [
                  MaterialButton(
                    height: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.all(0),
                    minWidth: 0,
                    onPressed: () => _homeController.savePetData(),
                    child: Container(
                      width: _homeController.showBackBTN ? 150 : Get.width,
                      padding: EdgeInsets.only(
                        top: 15,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: fontName,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  _homeController.showBackBTN
                      ? MaterialButton(
                          height: 0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          minWidth: 0,
                          onPressed: () => _homeController.backFromCreate(3),
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
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
