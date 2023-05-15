import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/view/owner/components/home/editPet.dart';

import '../../../../constants.dart';
import '../../../../controller/mainController.dart';
import '../../../../controller/owners/homeController.dart';

class EditPetScreen extends StatelessWidget {
  EditPetScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (mController) => Scaffold(
          backgroundColor: kSecondColor,
          body: GetBuilder<HomeController>(
              builder: (mController) => Container(
                    height: Get.height,
                    width: Get.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          MaterialButton(
                            height: 0,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: const EdgeInsets.all(0),
                            minWidth: 0,
                            onPressed: () => Get.back(),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: kDefaultPadding),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          editPet()
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
