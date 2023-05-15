import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:pets/view/admin/users/edit.dart';

// this class for gender model
enum Gender { male, female }

// this class for gender model
enum Kind { Owner, PetCare, Hotel }

class userController extends GetxController {
  bool showUsers = false;

  var users = [];

  // this key for pet form
  final formKey = GlobalKey<FormState>();

  final firstNameEditController = TextEditingController();
  final lastNameEditController = TextEditingController();
  final addressNameEditController = TextEditingController();
  final phoneNameEditController = TextEditingController();

  //gender group for radio button
  Gender? gender = Gender.male;
//gender group for radio button
  Kind? kind = Kind.Owner;

  String userEditID = '';

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  // this function to change radio button value

  RadioChanged(value) {
    gender = value;
    update();
  }
  // this function to change radio button value

  RadioKindChanged(value) {
    kind = value;
    update();
  }

  prepareEditUser(index) {
    firstNameEditController.text = users[index]['firstName'];
    lastNameEditController.text = users[index]['lastName'];
    addressNameEditController.text = users[index]['address'];
    phoneNameEditController.text = users[index]['phone'];
    userEditID = users[index]['id'];
    gender = users[index]['gender'] == 0 ? Gender.male : Gender.female;
    kind = users[index]['kind'] == 0
        ? Kind.Owner
        : users[index]['kind'] == 1
            ? Kind.PetCare
            : Kind.Hotel;
    Get.to(() => UserEditScreen());
  }

// to edit User in firebase
  editUserCare() async {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        FirebaseFirestore.instance.collection('user').doc(userEditID).update({
          'address': addressNameEditController.text.trim(),
          'firstName': firstNameEditController.text.trim(),
          'lastName': lastNameEditController.text.trim(),
          'kind': kind == Kind.Owner
              ? 0
              : kind == Kind.PetCare
                  ? 1
                  : 2,
          'phone': phoneNameEditController.text.trim(),
          'gender': gender == Gender.male ? 0 : 1,
        });

        Get.back();
        EasyLoading.showSuccess('Edit Successfully');
        getUsers();
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  getUsers() async {
    try {
      showUsers = false;
      final snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('kind', isNotEqualTo: 3)
          .get()
          .then((value) {
        users.clear();
        for (int i = 0; i < value.docs.length; i++) {
          users.add({
            'id': value.docs[i].id,
            'firstName': value.docs[i]['firstName'],
            'lastName': value.docs[i]['lastName'],
            'address': value.docs[i]['address'],
            'kind': value.docs[i]['kind'],
            'phone': value.docs[i]['phone'],
            'gender': value.docs[i]['gender'],
          });
        }
        print(users);
        showUsers = true;
        update();
      });
      update();
    } catch (e) {
      print(e);
    }
  }
}
