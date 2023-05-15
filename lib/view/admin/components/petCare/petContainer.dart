import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/admin/components/petCare/petCard.dart';

import '../../../../../constants.dart';

import '../../../../controller/admin/petController.dart';
import '../../petCare/addPet.dart';

PetAdminController _petController = Get.put(PetAdminController());

Container petContainer() {
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Veterinarians',
              style: TextStyle(
                  fontFamily: fontName, fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => Get.to(() => AddPetScreen()),
                child: Text(
                  '+',
                  style: TextStyle(
                      fontFamily: fontName, fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        GetBuilder<PetAdminController>(
            init: PetAdminController(),
            builder: (controller) => SingleChildScrollView(
                    child: Container(
                  height: Get.height - (prefSize + topPadding + 115),
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
