import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../utils/times.dart';

class CalenderController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

  // array to store date for week
  List<int> dayList = [];

// to store a new day after click
  String daySelected = '';

//to store complete day
  String daySelectedCom = '';
// save on it time that selected for booking
  String timeSelected = '';

// this variable to store petCare booked times
  var timeBooking = [];

  // save on it time to that selected for booking
  String timeSelectedTo = '';

  @override
  void onInit() {
    prepareBooking();
    super.onInit();
  }

//this function for open petCare page
  prepareBooking() {
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

    checkTime();
    for (int i = 0; i < times.length; i++) {
      times[i]['selected'] = 0;
    }

    update();
  }

//checking booking time
  checkTime() async {
    try {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      //  String formattedDate = formatter.format(now);
      // print(daySelectedCom);
      final snapshot = await FirebaseFirestore.instance
          .collection('booking')
          .where('kind_id', isEqualTo: storageInfo.read(userPetCareId))
          .where('kind', isEqualTo: 0)
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
          .where('kind_id', isEqualTo: storageInfo.read(userPetCareId))
          .where('kind', isEqualTo: 0)
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
}
