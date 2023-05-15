import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/owner/components/petCare/petCard.dart';

import '../../../../../constants.dart';
import '../../../../../controller/owners/petController.dart';

PetController _petController = Get.put(PetController());

Container petContainer() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Veterinary',
          style: TextStyle(
              fontFamily: fontName, fontSize: 18, color: Colors.black),
        ),
        GetBuilder<PetController>(
            init: PetController(),
            builder: (controller) => SingleChildScrollView(
                    child: Container(
                  height: Get.height - (prefSize + topPadding + 114),
                  child: _petController.showPetCare
                      ? ListView.builder(
                          itemCount: _petController.petCare.length,
                          itemBuilder: ((context, index) {
                            return petCard(index);
                          }))
                      : SizedBox(),
                ))),
      ],
    ),
  );
}
