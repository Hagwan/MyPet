import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets/controller/mainController.dart';

import '../../view/admin/hotel/editHotel.dart';

class HotelAdminController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

// to store hotel in it
  var Hotel = [];

// to store users in it
  var users = [];

//to show hotel after get data
  bool showHotel = false;

  // this key for pet form
  final formKey = GlobalKey<FormState>();

  // this controllers for petcare data page
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final addressMapController = TextEditingController();
  // this controllers for petcare edit data page
  final nameEditController = TextEditingController();
  final addressEditController = TextEditingController();

//variable store image pet url
  String imageURL =
      "https://firebasestorage.googleapis.com/v0/b/pets-b3542.appspot.com/o/hotel%2Fhotel.png?alt=media&token=6f53b8df-3c95-4616-a7dd-324adc1fe352";

  String imageURLEdit = "";

  String hotelIDEdit = '';

  // this variable to store dropdown value
  String dropValue = Get.find<MainController>().dropValue;
  //this variable to store dropdown values
  List<String> dropValues = Get.find<MainController>().dropValues;

  @override
  void onInit() {
    getHotel();

    super.onInit();
  }

//when value changed in dropdown call this function

  dropChangedValue(value) {
    dropValue = value;
    update();
  }

//to prepare petcare info and go to edit page
  openEditPetCare(index) {
    nameEditController.text = Hotel[index]['name'];
    addressEditController.text = Hotel[index]['address'];
    imageURLEdit = Hotel[index]['image'];
    hotelIDEdit = Hotel[index]['id'];

    Get.to(() => EditHotelScreen());
    update();
  }

  deleteHotelData() {
    try {
      FirebaseFirestore.instance.collection('hotel').doc(hotelIDEdit).delete();

      Get.back();
      getHotel();
      update();
    } catch (e) {
      print(e);
    }
  }

// to store a new pet care in firebase
  editNewPetCare() async {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        FirebaseFirestore.instance.collection('hotel').doc(hotelIDEdit).update({
          'address': addressEditController.text.trim(),
          'image': imageURLEdit,
          'name': nameEditController.text.trim(),
        });

        Get.back();
        EasyLoading.showSuccess('Edit Successfully');
        getHotel();
        update();
      }
    } catch (e) {
      print(e);
    }
  }

//this function to change petcare image  and upload it
  uploadImage(add) async {
    try {
      //EasyLoading.show(status: 'Please Wait');
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();

        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImage = referenceRoot.child("hotel");
        Reference referenceImageToUpload =
            referenceDirImage.child(uniqueFileName);
        var uploadTask = referenceImageToUpload.putFile(File(file.path));
        uploadTask.whenComplete(() async {
          add
              ? imageURL = await referenceImageToUpload.getDownloadURL()
              : imageURLEdit = await referenceImageToUpload.getDownloadURL();
          update();
        });

        update();
      }
    } catch (e) {
      print(e);
    }
  }

// to store a new pet care in firebase
  addNewPetCare() async {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        var userL = Get.find<MainController>().users;
        String userIDForHotel = '';
        String userName = '';
        for (int i = 0; i < userL.length; i++) {
          if (userL[i]['firstName'] + " " + userL[i]['lastName'] ==
              (dropValue)) {
            userIDForHotel = userL[i]['id'];
            userName = userL[i]['firstName'] + " " + userL[i]['lastName'];
          }
        }

        final CollectionReference userRef =
            FirebaseFirestore.instance.collection('hotel');
        userRef.add({
          'address': addressController.text.trim(),
          'image': imageURL,
          'name': nameController.text.trim(),
          'map': addressMapController.text.trim(),
          'user_id': userIDForHotel,
        });
        addressController.text = "";
        nameController.text = "";
        addressMapController.text = "";
        imageURL =
            "https://firebasestorage.googleapis.com/v0/b/pets-b3542.appspot.com/o/hotel%2Fhotel.png?alt=media&token=6f53b8df-3c95-4616-a7dd-324adc1fe352";
        EasyLoading.showSuccess('Add Successfully');
        getHotel();
        update();
      }
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
}
