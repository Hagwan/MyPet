import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/constants.dart';
import 'package:pets/view/owner/home/editPet.dart';

class HomeController extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();
  //this variable for check if owner have pets or not to select which page show to user
  bool havePets = true;

  //this variable for show pages to create your pets
  int petPage = 1;

// this for select which animal user choose  0 for cat 1 for dogs
  int whichAnimal = 0;

  // this controllers for pet data page
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final birthController = TextEditingController();
  final breedController = TextEditingController();
  final colorController = TextEditingController();
  final weightController = TextEditingController();
  final vaccinationController = TextEditingController();
  final microshipController = TextEditingController();
  final passportController = TextEditingController();
  final spayController = TextEditingController();
  final noteController = TextEditingController();

  // this controllers for pet data edit page
  final nameEditController = TextEditingController();
  final genderEditController = TextEditingController();
  final birthEditController = TextEditingController();
  final breedEditController = TextEditingController();
  final colorEditController = TextEditingController();
  final weightEditController = TextEditingController();
  final vaccinationEditController = TextEditingController();
  final microshipEditController = TextEditingController();
  final passportEditController = TextEditingController();
  final spayEditController = TextEditingController();
  final noteEditController = TextEditingController();
  // to save pet id for edit
  String petID = '';

  // this key for pet form
  final formKey = GlobalKey<FormState>();

  // this variable to save pets array in it from firebase
  var petList = [];

  //show back button in creations pages
  bool showBackBTN = false;

// this list for store pets name
  List<String> petsName = [];

  @override
  void onInit() {
    getUserPets();
    super.onInit();
  }

  // this function to back from create
  backFromCreate(pageNum) {
    if (pageNum == 1) {
      havePets = true;
      showBackBTN = false;
    } else if (pageNum == 2) {
      petPage = 1;
    } else if (pageNum == 3) {
      petPage = 2;
    }
    update();
  }

  // this function to add new pets
  openNewPetPage() {
    havePets = false;
    petPage = 1;
    showBackBTN = true;
    update();
  }

// this function for prepare name for dropdown
  preparePetsName() {
    petsName.clear();
    for (int x = 0; x < petList.length; x++) {
      petsName.add(petList[x]['name']);
    }
  }

  // this function to get user pets from firebase
  getUserPets() async {
    try {
      String uid = storageInfo.read(userId);

      final snapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('user_id', isEqualTo: uid)
          .get()
          .then((value) {
        if (value.docs.length > 0) {
          havePets = true;
          petList.clear();
          for (int i = 0; i < value.docs.length; i++) {
            petList.add({
              'id': value.docs[i].id,
              'name': value.docs[i]['name'],
              'birth': value.docs[i]['birth'],
              'color': value.docs[i]['color'],
              'gender': value.docs[i]['gender'],
              'kind': value.docs[i]['kind'],
              'breed': value.docs[i]['breed'],
              'weight': value.docs[i]['weight'],
              'vaccination': value.docs[i]['vaccination'],
              'microship': value.docs[i]['microship'],
              'passport': value.docs[i]['passport'],
              'spay': value.docs[i]['spay'],
              'note': value.docs[i]['note'],
            });
            preparePetsName();
          }
          storageInfo.write(userPetId, petList[0]['id']);
        } else {
          havePets = false;
        }
      });
      update();
    } catch (e) {
      print(e);
    }
  }

// this function to prepare pet info for edit and go to pet edit page
  preparePetToEdit(index) {
    petID = petList[index]['id'];
    nameEditController.text = petList[index]['name'];
    genderEditController.text = petList[index]['gender'];
    birthEditController.text = petList[index]['birth'];
    breedEditController.text = petList[index]['breed'];
    colorEditController.text = petList[index]['color'];
    weightEditController.text = petList[index]['weight'];
    vaccinationEditController.text = petList[index]['vaccination'];
    microshipEditController.text = petList[index]['microship'];
    passportEditController.text = petList[index]['passport'];
    spayEditController.text = petList[index]['spay'];
    noteEditController.text = petList[index]['note'];
    print(petList[index]['color']);
    Get.to(() => EditPetScreen());
  }

  //this function to change pages create pets
  changePetPages(page) {
    petPage = page;
    update();
  }

  // this function to select pet
  selectPet(pet) {
    whichAnimal = pet;
    changePetPages(3);
    update();
  }

  //this function to save pet data
  savePetData() {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        String uid = storageInfo.read(userId);

        final CollectionReference userRef =
            FirebaseFirestore.instance.collection('pets');

        userRef.add({
          'user_id': uid,
          'name': nameController.text.trim(),
          'kind': whichAnimal,
          'gender': genderController.text.trim(),
          'birth': birthController.text.trim(),
          'breed': breedController.text.trim(),
          'color': colorController.text.trim(),
          'weight': weightController.text.trim(),
          'vaccination': vaccinationController.text.trim(),
          'microship': microshipController.text.trim(),
          'passport': passportController.text.trim(),
          'spay': spayController.text.trim(),
          'note': noteController.text.trim(),
        });
        havePets = true;

        getUserPets();
        nameController.text = "";
        genderController.text = "";
        birthController.text = "";
        colorController.text = "";
        breedController.text = "";
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  //this function to update pet data
  updatePetData() {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        String uid = storageInfo.read(userId);
        print(uid);

        FirebaseFirestore.instance.collection('pets').doc(petID).update({
          'name': nameEditController.text.trim(),
          'gender': genderEditController.text.trim(),
          'birth': birthEditController.text.trim(),
          'breed': breedEditController.text.trim(),
          'color': colorEditController.text.trim(),
          'weight': weightEditController.text.trim(),
          'vaccination': vaccinationEditController.text.trim(),
          'microship': microshipEditController.text.trim(),
          'passport': passportEditController.text.trim(),
          'spay': spayEditController.text.trim(),
          'note': noteEditController.text.trim(),
        });

        Get.back();
        getUserPets();
        update();
      }
    } catch (e) {
      print(e);
    }
  }

//this function to delete pet data
  deletePetData() {
    try {
      final isValid = formKey.currentState!.validate();
      Get.focusScope?.unfocus();
      if (isValid) {
        String uid = storageInfo.read(userId);

        FirebaseFirestore.instance.collection('pets').doc(petID).delete();

        Get.back();
        getUserPets();
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}
