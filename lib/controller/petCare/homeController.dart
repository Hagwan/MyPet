import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants.dart';

class PetCareHomeController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

// this variable to disappear booking card until data come from firebase
  bool showBooking = false;

// to store booking in it
  var bookingList = [];

  @override
  void onInit() {
    getPetCareData();
    super.onInit();
  }

// this function for get petCare data from firebase
  getPetCareData() async {
    try {
      showBooking = false;
      //to store user id in it
      String pid = storageInfo.read(userPetCareId);

      await FirebaseFirestore.instance
          .collection('booking')
          .where('kind_id', isEqualTo: pid)
          .where('kind', isEqualTo: 0)
          .orderBy('dateDay', descending: true)
          .get()
          .then((value) {
        bookingList.clear();
        print(value.docs.length);
        print(pid);
        if (value.docs.length > 0) {
          for (int i = 0; i < value.docs.length; i++) {
            bookingList.add({
              'id': value.docs[i].id,
              'dateDay': value.docs[i]['dateDay'],
              'dateTime': value.docs[i]['dateTime'],
              'confirm': value.docs[i]['confirm'],
              'kind': value.docs[i]['kind'],
              'kind_id': value.docs[i]['kind_id'],
              'pet_id': value.docs[i]['pet_id'],
              'name': value.docs[i]['name'],
              'address': value.docs[i]['address'],
              'image': value.docs[i]['image'],
              'dateTimeTo': value.docs[i]['dateTimeTo'],
              'petName': value.docs[i]['petName'],
              'note': value.docs[i]['note'],
            });
            print(value.docs[i]['petName']);
          }
        }
        print(bookingList.length);
        showBooking = true;
      });

      update();
    } catch (e) {
      print(e);
    }
  }

// this function to change confirm status for booking
  void changeConfirmStatus(petID, index) {
    try {
      FirebaseFirestore.instance.collection('booking').doc(petID).update({
        'confirm': 1,
      });
      bookingList[index]['confirm'] = 1;
      EasyLoading.showSuccess('Confirmed Successfully');
      update();
    } catch (e) {
      print(e);
    }
  }
}
