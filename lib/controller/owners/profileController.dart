import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/controller/mainController.dart';
import 'package:pets/view/welcome/welcome.dart';

import '../../constants.dart';

// this class for gender model
enum Gender { male, female }

class ProfileController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();

  //gender group for radio button
  Gender? gender = Gender.male;

  // this controllers for sign up page
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailSignUpController = TextEditingController();
  // final passSignUpController = TextEditingController();

  // this key for pet form
  final formKey = GlobalKey<FormState>();

  String userFirstName = "";
  String userLastName = "";

  int userG = 0;
  @override
  void onInit() {
    prepareUserInfo();

    super.onInit();
  }

  // this function to prepare user data from storage and set them in variabes
  prepareUserInfo() {
    userFirstName = storageInfo.read(userFName) ?? "";
    userLastName = storageInfo.read(userLName) ?? "";
    userG = int.parse(storageInfo.read(userGender).toString());
    fNameController.text = userFirstName;
    lNameController.text = userLastName;
    gender = userG == 0 ? Gender.male : Gender.female;
    addressController.text = storageInfo.read(userAddress);
    phoneController.text = storageInfo.read(userPhone);
    emailSignUpController.text = storageInfo.read(userEmail);
    update();
  }

  // this function to change radio button value
  RadioChanged(value) {
    gender = value;
    update();
  }

  // this function to update user data
  updateUserData() {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        String uid = storageInfo.read(userId);
        print(uid);

        FirebaseFirestore.instance.collection('user').doc(uid).update({
          'address': addressController.text.trim(),
          'email': emailSignUpController.text.trim(),
          'firstName': fNameController.text.trim(),
          'lastName': lNameController.text.trim(),
          'phone': phoneController.text.trim(),
          'gender': gender == Gender.male ? 0 : 1
        });

        storageInfo.write(userEmail, emailSignUpController.text.trim());
        storageInfo.write(userFName, fNameController.text.trim());
        storageInfo.write(userLName, lNameController.text.trim());
        storageInfo.write(userAddress, addressController.text.trim());
        storageInfo.write(userPhone, phoneController.text.trim());
        storageInfo.write(userGender, gender == Gender.male ? 0 : 1);
        prepareUserInfo();
        Get.find<MainController>().prepareUserGender();

        update();
        EasyLoading.showSuccess("Save successful");
      }
    } catch (e) {
      print(e);
    }
  }

  chnagePassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailSignUpController.text)
        .then((value) =>
            EasyLoading.showToast('Check your mail to reset your password'))
        .catchError((e) => EasyLoading.showError('Please try again'));
  }

  //this function to logout
  logout() {
    // this code write from firebase to logout
    FirebaseAuth.instance.signOut();
    Get.offAll(() => WelcomeScreen());
    update();
  }
}
