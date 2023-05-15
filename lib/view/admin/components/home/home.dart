import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../../../../../controller/mainController.dart';
import '../../../../../controller/owners/homeController.dart';

class HomeAdminContainer extends StatelessWidget {
  HomeAdminContainer({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (Controller) => Scaffold(
          body: GetBuilder<HomeController>(
              builder: (mController) => Container(
                    height: Get.height - (prefSize + 115),
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          height: 0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          minWidth: 0,
                          onPressed: (() => Controller.navBarAdminSelected(4)),
                          child: Container(
                            width: 120,
                            height: 135,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kSecondColor),
                            child: Image.asset("assets/images/hotel.png"),
                          ),
                        ),
                        MaterialButton(
                          height: 0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: const EdgeInsets.all(0),
                          minWidth: 0,
                          onPressed: (() => Controller.navBarAdminSelected(1)),
                          child: Container(
                            width: 120,
                            height: 135,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kSecondColor),
                            child: Image.asset("assets/images/petcare.png"),
                          ),
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
