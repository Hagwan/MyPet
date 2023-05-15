// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/controller/owners/bookingController.dart';
import 'package:pets/view/admin/components/home/home.dart';
import 'package:pets/view/owner/chat/home.dart';

import '../constants.dart';
import '../view/admin/hotel/home.dart';
import '../view/admin/petCare/home.dart';
import '../view/admin/users/home.dart';
import '../view/hotel/calender/home.dart';
import '../view/hotel/chat/home.dart';
import '../view/hotel/components/home/home.dart';
import '../view/hotel/profile/profile.dart';
import '../view/owner/booking/home.dart';

import '../view/owner/components/home/home.dart';

import '../view/owner/components/hotel/payment.dart';
import '../view/owner/components/petCare/payment.dart';
import '../view/owner/hotel/booking.dart';
import '../view/owner/hotel/home.dart';
import '../view/owner/petCare/booking.dart';
import '../view/owner/petCare/home.dart';
import '../view/owner/tips/home.dart';
import '../view/petCare/calender/home.dart';
import '../view/petCare/chat/home.dart';
import '../view/petCare/components/home/home.dart';
import '../view/petCare/profile/profile.dart';

class MainController extends GetxController {
  // this variable to store the page to view in to show to owner user
  late Widget pageContainer;
  // this variable to store the page to view in to show to petCare user
  late Widget pagePetCareContainer;
  // this variable to store the page to view in to show to hotel user
  late Widget pageHotelContainer;
// this variable to store the page to view in to show to admin user
  late Widget pageAdminContainer;
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

//to store user gender
  int userG = 0;

  //to save which user login owner, petCare or Hotel
  int user_kind = 0;

// to store users in it
  var users = [];

// to store users in it
  var usersPetCare = [];

//to show hotel after get data
  bool showHotel = false;

  // this variable to store dropdown value
  String dropValue = '';
  //this variable to store dropdown values
  List<String> dropValues = [];

// this variable to store dropdown value
  String dropValuePetCare = '';
  //this variable to store dropdown values
  List<String> dropValuesPetCare = [];

  @override
  void onInit() {
    pageContainer = HomeContainer();
    pagePetCareContainer = HomePetCareContainer();
    pageHotelContainer = HomeHotelContainer();
    pageAdminContainer = HomeAdminContainer();
    prepareUserGender();
    getHotelUsersData();
    getPetCareUsersData();
    super.onInit();
  }

  prepareUserGender() {
    try {
      userG = int.parse(storageInfo.read(userGender).toString());
      user_kind = int.parse(storageInfo.read(userKind).toString());
    } catch (_) {
      userG = 0;
      user_kind -= 0;
    }
    update();
  }

//this function to get users functions
  getHotelUsersData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('kind', isEqualTo: 0)
          .get()
          .then((value) {
        users.clear();
        for (int i = 0; i < value.docs.length; i++) {
          users.add({
            'id': value.docs[i].id,
            'firstName': value.docs[i]['firstName'],
            'lastName': value.docs[i]['lastName'],
          });
        }
      });

      dropValues.clear();
      for (int x = 0; x < users.length; x++) {
        dropValues.add(users[x]['firstName'] + " " + users[x]['lastName']);
      }
      if (dropValues.length > 0) {
        dropValue = dropValues[0];
      }

      update();
    } catch (e) {
      print(e);
    }
  }

//this function to get users functions
  getPetCareUsersData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('kind', isEqualTo: 0)
          .get()
          .then((value) {
        usersPetCare.clear();
        for (int i = 0; i < value.docs.length; i++) {
          usersPetCare.add({
            'id': value.docs[i].id,
            'firstName': value.docs[i]['firstName'],
            'lastName': value.docs[i]['lastName'],
          });
        }
      });

      dropValuesPetCare.clear();
      for (int x = 0; x < usersPetCare.length; x++) {
        dropValuesPetCare.add(
            usersPetCare[x]['firstName'] + " " + usersPetCare[x]['lastName']);
      }
      if (dropValuesPetCare.length > 0) {
        dropValuePetCare = dropValuesPetCare[0];
      }

      update();
    } catch (e) {
      print(e);
    }
  }

//this for owner navbar
  void navBarSelected(index) {
    if (index == 0) {
      pageContainer = HomeContainer();
    } else if (index == 1) {
      pageContainer = petScreen();
    } else if (index == 2) {
      pageContainer = bookScreen();
    } else if (index == 3) {
      pageContainer = BookingPetCareScreen();
      Get.put<BookingControler>(BookingControler()).getBooking();
    } else if (index == 4) {
      pageContainer = HotellScreen();
    } else if (index == 5) {
      pageContainer = HotelPetCareScreen();
    } else if (index == 6) {
      pageContainer = PaymentContainer();
    } else if (index == 7) {
      pageContainer = TipsScreen();
    } else if (index == 8) {
      pageContainer = PaymentHotelContainer();
    } else if (index == 9) {
      pageContainer = ChatHome();
    }
    update();
  }

  //this for owner navbar
  void navBarAdminSelected(index) {
    if (index == 0) {
      pageAdminContainer = HomeAdminContainer();
    } else if (index == 1) {
      pageAdminContainer = petAdminScreen();
    } else if (index == 4) {
      pageAdminContainer = HotelAdminScreen();
    } else if (index == 3) {
      pageAdminContainer = UsersHomeScreen();
    }
    update();
  }

  //this for owner navbar
  void navBarPetCareSelected(index) {
    if (index == 0) {
      pagePetCareContainer = HomePetCareContainer();
    } else if (index == 1) {
      pagePetCareContainer = HomeCalender();
    } else if (index == 2) {
      pagePetCareContainer = ProfilePetScreenScreen();
    } else if (index == 3) {
      pagePetCareContainer = ChatPetCareHome();
    }
    update();
  }

  //this for owner navbar
  void navBarHotelSelected(index) {
    if (index == 0) {
      pageHotelContainer = HomeHotelContainer();
    } else if (index == 1) {
      pageHotelContainer = HomeHotelCalender();
    } else if (index == 2) {
      pageHotelContainer = ProfileHotelScreenScreen();
    } else if (index == 3) {
      pageHotelContainer = ChatHotelHome();
    }
    update();
  }
}
