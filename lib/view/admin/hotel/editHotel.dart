// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/admin/hotelController.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

class EditHotelScreen extends StatelessWidget {
  EditHotelScreen({super.key});

  HotelAdminController _petAdminController = Get.find();

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
                'Edit PetCare',
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
                    'Edit Pet Care',
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
                    key: _petAdminController.formKey,
                    child: GetBuilder<HotelAdminController>(
                        builder: (mController) => Container(
                              width: Get.width * .75,
                              child: Column(
                                children: [
                                  MaterialButton(
                                      height: 0,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      padding: const EdgeInsets.all(0),
                                      minWidth: 0,
                                      onPressed: () => _petAdminController
                                          .uploadImage(false),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: .5),
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Image.network(
                                            _petAdminController.imageURLEdit,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: kDefaultPadding * 1.5,
                                  ),
                                  TextFormField(
                                    controller:
                                        _petAdminController.nameEditController,
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
                                        hintText: 'PetCare Name',
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
                                    controller: _petAdminController
                                        .addressEditController,
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
                                        hintText: 'PetCare Address',
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
                                        onPressed: () => _petAdminController
                                            .editNewPetCare(),
                                        child: Container(
                                          width: Get.width * .345,
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
                                      ),
                                      SizedBox(
                                        width: kDefaultPadding,
                                      ),
                                      MaterialButton(
                                        height: 0,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        padding: const EdgeInsets.all(0),
                                        minWidth: 0,
                                        onPressed: () => _petAdminController
                                            .deleteHotelData(),
                                        child: Container(
                                          width: Get.width * .345,
                                          padding: EdgeInsets.only(
                                            top: 13,
                                            bottom: 6,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            'Delete',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: fontName,
                                                fontSize: 17,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
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
