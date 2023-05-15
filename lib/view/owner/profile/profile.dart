import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/profileController.dart';
import 'package:pets/view/owner/profile/editProfile.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (mController) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // leadingWidth: 25,
            elevation: 0.0,
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                'Profile',
                style: TextStyle(fontFamily: fontName, fontSize: 20),
              ),
            ),
            leading: MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          backgroundColor: kSecondColor,
          body: GetBuilder<MainController>(
              builder: (mController) => SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: kDefaultPadding),
                          child: Image.asset(
                            _profileController.userG == 0
                                ? "assets/images/man.png"
                                : "assets/images/girl.png",
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Text(
                            '${_profileController.userFirstName + " " + _profileController.userLastName}'),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: Get.width,
                          margin:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.only(
                                    top: 6,
                                    // bottom: 8,
                                    left: kDefaultPadding / 2,
                                    right: kDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                child: MaterialButton(
                                  height: 0,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  padding: const EdgeInsets.all(0),
                                  minWidth: 0,
                                  onPressed: () =>
                                      Get.to(() => EditProfileScreen()),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            fontFamily: fontName, fontSize: 19),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.only(
                                    top: 6,
                                    // bottom: 8,
                                    left: kDefaultPadding / 2,
                                    right: kDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                child: MaterialButton(
                                  height: 0,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  padding: const EdgeInsets.all(0),
                                  minWidth: 0,
                                  onPressed: () =>
                                      _profileController.chnagePassword(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Change Password',
                                        style: TextStyle(
                                            fontFamily: fontName, fontSize: 19),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Icon(
                                          Icons.password,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.only(
                                    top: 6,
                                    // bottom: 8,
                                    left: kDefaultPadding / 2,
                                    right: kDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                child: MaterialButton(
                                  height: 0,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  padding: const EdgeInsets.all(0),
                                  minWidth: 0,
                                  onPressed: () => _profileController.logout(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                            fontFamily: fontName, fontSize: 19),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Icon(
                                          Icons.logout,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
