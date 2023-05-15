import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/constants.dart';
import 'package:pets/controller/mainController.dart';
import 'package:pets/controller/owners/homeController.dart';
import 'package:pets/controller/petCare/homeController.dart';

import '../view/admin/home/home.dart';
import '../view/home/home.dart';
import '../view/hotel/home/home.dart';
import '../view/petCare/home/home.dart';

// this class for gender model
enum Gender { male, female }

class AuthController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

  //this controllers for sign in page
  final emailControler = TextEditingController();
  final passController = TextEditingController();

  //gender group for radio button
  Gender? gender = Gender.male;

  // this controllers for sign up page
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailSignUpController = TextEditingController();
  final passSignUpController = TextEditingController();

  late UserCredential userCredential;

  // this function to change radio button value

  RadioChanged(value) {
    gender = value;
    update();
  }

  Future signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailControler.text.trim(),
              password: passController.text.trim());
      User? user = userCredential.user;
      //function call
      getDataFromFirebase(user);
    } catch (e) {
      EasyLoading.showError('Email or Password is an error');
    }
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailSignUpController.text.trim(),
              password: passSignUpController.text.trim())
          .then((value) {
        User? user = value.user;

        //function call
        return storeDataInFirebase(user);
      });
    } catch (e) {
      print(e);
      EasyLoading.showError('Email is already registered');
    }
  }

  // this function to store user data in firebase after signup
  storeDataInFirebase(user) {
    try {
      storageInfo.write(userId, user?.uid);
      storageInfo.write(userEmail, emailSignUpController.text.trim());
      storageInfo.write(userFName, fNameController.text.trim());
      storageInfo.write(userLName, lNameController.text.trim());
      storageInfo.write(userAddress, addressController.text.trim());
      storageInfo.write(userPhone, phoneController.text.trim());
      storageInfo.write(userGender, gender == Gender.male ? 0 : 1);
      storageInfo.write(userKind, 0);

      Get.offAll(() => HomeScreen());

      final CollectionReference userRef =
          FirebaseFirestore.instance.collection('user');
      userRef.doc(user?.uid).set({
        'address': addressController.text.trim(),
        'email': emailSignUpController.text.trim(),
        'firstName': fNameController.text.trim(),
        'lastName': lNameController.text.trim(),
        'phone': phoneController.text.trim(),
        'kind': 0, // 0 for pet owner  1 for petcare   2 for hotel  3 for admin
        'gender': gender == Gender.male ? 0 : 1
      });
      Get.put<HomeController>(HomeController()).getUserPets();
      Get.put<MainController>(MainController()).prepareUserGender();
    } catch (e) {
      print(e);
    }
  }

  // this function to get user data from firebase after login
  getDataFromFirebase(user) async {
    try {
      late DocumentSnapshot querySnapshot;

      await FirebaseFirestore.instance
          .collection("user")
          .doc(user?.uid)
          .get()
          .then((value) => querySnapshot = value);

      storageInfo.write(userId, user?.uid);
      storageInfo.write(userEmail, querySnapshot['email']);
      storageInfo.write(userFName, querySnapshot['firstName']);
      storageInfo.write(userLName, querySnapshot['lastName']);
      storageInfo.write(userAddress, querySnapshot['address']);
      storageInfo.write(userPhone, querySnapshot['phone']);
      storageInfo.write(userGender, querySnapshot['gender']);
      storageInfo.write(userKind, querySnapshot['kind']);
      print(querySnapshot['kind']);
      querySnapshot['kind'] == 0
          ? Get.offAll(() => HomeScreen())
          : querySnapshot['kind'] == 1
              ? Get.offAll(() => homePetCareScreen())
              : querySnapshot['kind'] == 2
                  ? Get.offAll(() => homeHotelScreen())
                  : Get.offAll(() => HomeAdminScreen());

      querySnapshot['kind'] == 0
          ? Get.put<HomeController>(HomeController()).getUserPets()
          : querySnapshot['kind'] == 1
              ? Get.put<PetCareHomeController>(PetCareHomeController())
                  .getPetCareData()
              : querySnapshot['kind'] == 2
                  ? null
                  : null;
      querySnapshot['kind'] == 1
          ? getPetCareInfo()
          : querySnapshot['kind'] == 2
              ? getHotelInfo()
              : null;
      Get.put<MainController>(MainController()).prepareUserGender();
    } catch (e) {
      print(e);
    }
  }

//this fucntion to get hotel info after login with hotel account
  getHotelInfo() async {
    //to store user id in it
    String uid = storageInfo.read(userId);

    await FirebaseFirestore.instance
        .collection("hotel")
        .where('user_id', isEqualTo: uid)
        .get()
        .then((value) {
      if (value.docs.length != 0) {
        storageInfo.write(userHotelId, value.docs[0].id);
      }
    });
  }

//this fucntion to get petcare info after login with petcare account
  getPetCareInfo() async {
    //to store user id in it
    String uid = storageInfo.read(userId);

    await FirebaseFirestore.instance
        .collection("petcare")
        .where('user_id', isEqualTo: uid)
        .get()
        .then((value) {
      if (value.docs.length != 0) {
        storageInfo.write(userPetCareId, value.docs[0].id);
      }
    });
  }
}
