import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/controller/mainController.dart';
import 'package:pets/controller/owners/chatController.dart';
import 'package:pets/controller/owners/homeController.dart';
import 'package:pets/utils/times.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class HotelController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

// to store hotel in it
  var Hotel = [];

  // array to store date for week
  List<int> dayList = [];

  // hotel booking info
  var hotelForBooking = [];

//to show hotel after get data
  bool showHotel = false;

  // save on it time that selected for booking
  String timeSelected = '';

  // save on it time to that selected for booking
  String timeSelectedTo = '';

//this variable to save id for edit
  String hotelID = '';

// to store a new day after click
  String daySelected = '';

// this variable to store hotel booked times
  var timeBooking = [];
  // this variable to store dropdown value
  String dropValue = Get.find<HomeController>().petList[0]['name'];
  //this variable to store dropdown values
  List<String> dropValues = Get.find<HomeController>().petsName;
//to store complete day
  String daySelectedCom = '';

// this controller for note textfield
  final noteController = TextEditingController();
  final cardNumController = TextEditingController();
  final cvvController = TextEditingController();
  final expiredNumController = TextEditingController();

  @override
  void onInit() {
    getHotel();
    super.onInit();
  }

//to open chat details
  openChatDetails(String cId) {
    Get.put<ChatController>(ChatController()).openChatDetails(cId, 1);
  }

// to select day and check time
  selectDay(index) async {
    try {
      daySelected = dayList[index].toString();
      timeSelected = '';
      for (int i = 0; i < times.length; i++) {
        times[i]['selected'] = 0;
      }
      update();
      var now = new DateTime.now();
      // var formatter = new DateFormat('yyyy-MM-dd');
      // String formattedDate = formatter.format(now);
      String dayCheck =
          now.year.toString() + "-" + now.month.toString() + "-" + daySelected;
      daySelectedCom = dayCheck;
      final snapshot = await FirebaseFirestore.instance
          .collection('booking')
          .where('kind_id', isEqualTo: hotelID)
          .where('kind', isEqualTo: 1)
          .where('dateDay', isEqualTo: dayCheck)
          .get();

      timeBooking.clear();

      for (int i = 0; i < snapshot.docs.length; i++) {
        timeBooking.add({
          'time': snapshot.docs[i]['dateTime'].toString(),
        });
      }
      update();
    } catch (e) {
      print(e);
    }
  }

//checking booking time
  checkTime() async {
    try {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      //   String formattedDate = formatter.format(now);

      final snapshot = await FirebaseFirestore.instance
          .collection('booking')
          .where('kind_id', isEqualTo: hotelID)
          .where('kind', isEqualTo: 1)
          .where('dateDay', isEqualTo: daySelectedCom)
          .get();

      timeBooking.clear();

      for (int i = 0; i < snapshot.docs.length; i++) {
        timeBooking.add({
          'time': snapshot.docs[i]['dateTime'].toString(),
        });
      }

      update();
    } catch (e) {
      print(e);
    }
  }

// this function for get hotel data from firebase
  getHotel() async {
    try {
      showHotel = false;
      final snapshot = await FirebaseFirestore.instance
          .collection('hotel')
          .get()
          .then((value) {
        Hotel.clear();
        for (int i = 0; i < value.docs.length; i++) {
          Hotel.add({
            'id': value.docs[i].id,
            'name': value.docs[i]['name'],
            'image': value.docs[i]['image'],
            'address': value.docs[i]['address'],
            'map': value.docs[i]['map'],
          });
          print(Hotel[i]);
        }
        showHotel = true;
      });

      update();
    } catch (e) {
      print(e);
    }
  }

// this function to select time for booking
  selectTime(index) {
    for (int i = 0; i < times.length; i++) {
      times[i]['selected'] = 0;
    }
    times[index]['selected'] = 1;
    timeSelected =
        times[index]['time'].toString() + " " + times[index]['for'].toString();
    timeSelectedTo = (times.length - 1) == index
        ? '10:00 PM'
        : times[index + 1]['time'].toString() +
            " " +
            times[index + 1]['for'].toString();
    update();
  }

// this function to save booking in firebase
  saveBooking() {
    try {
      // var now = new DateTime.now();
      // var formatter = new DateFormat('yyyy-MM-dd');
      // String formattedDate = formatter.format(now);
      if (cardNumController.text.trim() != "" &&
          expiredNumController.text.trim() != "" &&
          cvvController.text.trim() != "") {
        var petL = Get.find<HomeController>().petList;
        String petID = '';
        String petName = '';
        for (int i = 0; i < petL.length; i++) {
          if (petL[i]['name'] == (dropValue)) {
            petID = petL[i]['id'];
            petName = petL[i]['name'];
          }
        }

        final CollectionReference userRef =
            FirebaseFirestore.instance.collection('booking');

        userRef.add({
          'pet_id': petID,
          'kind_id': hotelForBooking[0]['id'],
          'dateDay': daySelectedCom,
          'dateTime': timeSelected,
          'kind': 1, // here 0 for petcare booking , 1 for hotel booking
          'confirm': 0,
          'user_id': storageInfo.read(userId),
          'dateTimeTo': timeSelectedTo,
          'name': hotelForBooking[0]['name'],
          'address': hotelForBooking[0]['address'],
          'image': hotelForBooking[0]['image'],
          'note': noteController.text,
          'petName': petName
        });
        timeSelected = '';
        EasyLoading.showSuccess('Save Successful');
        checkTime();
        cardNumController.text = '';
        expiredNumController.text = '';
        cvvController.text = '';
        Get.find<MainController>().navBarSelected(4);
      } else {
        EasyLoading.showError("Please select time");
      }
    } catch (e) {
      print(e);
    }
  }

  checkBooking() {
    if (timeSelected != "") {
      Get.find<MainController>().navBarSelected(8);
    } else {
      EasyLoading.showError("Please insert all fields");
    }
  }
//when value changed in dropdown call this function

  dropChangedValue(value) {
    dropValue = value;
    update();
  }

//this function for open hotel page
  openBookingHotel(index) {
    DateTime now = new DateTime.now();
    dayList.clear();
    for (int i = 0; i < 8; i++) {
      DateTime date = new DateTime(now.year, now.month, now.day + (i));
      if (i == 0) {
        daySelected = date.day.toString();
        daySelectedCom = now.year.toString() +
            "-" +
            now.month.toString() +
            "-" +
            now.day.toString();
      }
      dayList.add(int.parse(date.day.toString()));
    }
    hotelID = Hotel[index]['id'];
    hotelForBooking.add(Hotel[index]);
    checkTime();
    for (int i = 0; i < times.length; i++) {
      times[i]['selected'] = 0;
    }
    dropValues = Get.find<HomeController>().petsName;
    dropValue = Get.find<HomeController>().petList[0]['name'];

    Get.find<MainController>().navBarSelected(5);
    update();
  }
}
