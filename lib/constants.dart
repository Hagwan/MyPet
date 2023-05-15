import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kPrimaryColor = Color(0xFF559FED);
const kSecondColor = Color(0xFFF0F2F5);
const kThirdColor = Color(0xffD9D9D9);

const kDefaultPadding = 20.0;
const double kDefaultTopPadding = 60;

const bottomNavHeight = 90;
double prefSize = AppBar().preferredSize.height;
double topPadding = MediaQuery.of(Get.context!).padding.top;

//general variable
const String fontName = "tajawal";

//storage variable
const String userId = 'userId';
const String userFName = 'userFName';
const String userLName = 'userLName';
const String userEmail = 'userEmail';
const String userGender = 'userGender';
const String userKind = 'userKind';
const String userAddress = 'userAddress';
const String userPhone = 'userPhone';
const String userPetId = 'userPetId';
const String userPetCareId = 'userPetCareId';
const String userHotelId = 'userHotelId';

// api domain
String domainUrl = "catfact.ninja";
