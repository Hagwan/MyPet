import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/constants.dart';

class BookingControler extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

// this variable to disappear booking card until data come from firebase
  bool showBooking = false;

// to store booking in it
  var bookingList = [];

  @override
  void onInit() {
    getBooking();
    super.onInit();
  }

// this function to get owner booking
  getBooking() async {
    try {
      showBooking = false;
      //to store user id in it
      String uid = storageInfo.read(userId);
      // to store booking address
      String address = '';

      //to store booking name
      String name = '';

      await FirebaseFirestore.instance
          .collection('booking')
          .where('user_id', isEqualTo: uid)
          .get()
          .then((value) {
        bookingList.clear();
        print(value.docs.length);
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
            });
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
}
