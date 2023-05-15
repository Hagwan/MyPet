import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/admin/petCare/editPet.dart';
import '../mainController.dart';

class PetAdminController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();
  //to show petcare after get data
  bool showPetCare = false;
// to store petsCare in it
  var petCare = [];

  // this key for pet form
  final formKey = GlobalKey<FormState>();

  // this controllers for petcare data page
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final addressMapController = TextEditingController();

  // this controllers for petcare edit data page
  final nameEditController = TextEditingController();
  final addressEditController = TextEditingController();

  // this variable to store dropdown value
  String dropValue = Get.find<MainController>().dropValuePetCare;
  //this variable to store dropdown values
  List<String> dropValues = Get.find<MainController>().dropValuesPetCare;

//variable store image pet url
  String imageURL =
      "https://firebasestorage.googleapis.com/v0/b/pets-b3542.appspot.com/o/petCare%2Fpetcare.png?alt=media&token=9fa3f224-a31d-40e4-978d-515191180d8f";

  String imageURLEdit = "";

  String petCareIDEdit = '';
  @override
  void onInit() {
    getPetData();
    super.onInit();
  }

//when value changed in dropdown call this function

  dropChangedValue(value) {
    dropValue = value;
    update();
  }

  deletePetData() {
    try {
      FirebaseFirestore.instance
          .collection('petcare')
          .doc(petCareIDEdit)
          .delete();

      Get.back();
      getPetData();
      update();
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
        Reference referenceDirImage = referenceRoot.child("petCare");
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

// to edit pet care in firebase
  editNewPetCare() async {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        FirebaseFirestore.instance
            .collection('petcare')
            .doc(petCareIDEdit)
            .update({
          'address': addressEditController.text.trim(),
          'image': imageURLEdit,
          'name': nameEditController.text.trim(),
        });

        Get.back();
        EasyLoading.showSuccess('Edit Successfully');
        getPetData();
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
        var userL = Get.find<MainController>().usersPetCare;
        String userIDForPetCare = '';
        String userName = '';
        for (int i = 0; i < userL.length; i++) {
          if (userL[i]['firstName'] + " " + userL[i]['lastName'] ==
              (dropValue)) {
            userIDForPetCare = userL[i]['id'];
            userName = userL[i]['firstName'] + " " + userL[i]['lastName'];
          }
        }
        final CollectionReference userRef =
            FirebaseFirestore.instance.collection('petcare');
        userRef.add({
          'address': addressController.text.trim(),
          'image': imageURL,
          'name': nameController.text.trim(),
          'map': addressMapController.text.trim(),
          'user_id': userIDForPetCare,
        });
        addressController.text = "";
        nameController.text = "";
        addressMapController.text = "";
        imageURL =
            "https://firebasestorage.googleapis.com/v0/b/pets-b3542.appspot.com/o/petCare%2Fpetcare.png?alt=media&token=9fa3f224-a31d-40e4-978d-515191180d8f";
        EasyLoading.showSuccess('Add Successfully');
        getPetData();
        update();
      }
    } catch (e) {
      print(e);
    }
  }

// this function for get petCare data from firebase
  getPetData() async {
    try {
      showPetCare = false;
      final snapshot = await FirebaseFirestore.instance
          .collection('petcare')
          .get()
          .then((value) {
        petCare.clear();
        for (int i = 0; i < value.docs.length; i++) {
          petCare.add({
            'id': value.docs[i].id,
            'name': value.docs[i]['name'],
            'image': value.docs[i]['image'],
            'address': value.docs[i]['address'],
          });
          print(petCare[i]);
        }
        showPetCare = true;
      });

      update();
    } catch (e) {
      print(e);
    }
  }

//to prepare petcare info and go to edit page
  openEditPetCare(index) {
    nameEditController.text = petCare[index]['name'];
    addressEditController.text = petCare[index]['address'];
    imageURLEdit = petCare[index]['image'];
    petCareIDEdit = petCare[index]['id'];

    Get.to(() => EditPetScreen());
    update();
  }
}
