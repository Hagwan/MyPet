import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/authcontroller.dart';
import 'package:pets/view/owner/auth/sign.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController _authController = Get.put(AuthController());

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
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/cat.png",
                      width: 200,
                      height: 200,
                      color: kPrimaryColor,
                    ),
                    Text(
                      'MyPet',
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 45,
                        color: kPrimaryColor,
                      ),
                    ),
                    Form(
                      child: Container(
                        width: Get.width * .75,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _authController.emailControler,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: fontName,
                                height: 2,
                              ),
                              cursorHeight: 27,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  //
                                  hintText: 'Email',
                                  hintStyle: const TextStyle(
                                    height: 2,
                                    fontFamily: fontName,
                                    fontSize: 16,
                                    color: Color(0xffA9A9A9),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, right: 10, left: 10)),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            TextFormField(
                              controller: _authController.passController,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: fontName,
                                height: 2,
                              ),
                              cursorHeight: 27,
                              obscureText: true,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  //

                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    height: 2,
                                    fontFamily: fontName,
                                    fontSize: 16,
                                    color: Color(0xffA9A9A9),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, right: 10, left: 10)),
                              keyboardType: TextInputType.text,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Don't have a account?",
                                  style: TextStyle(
                                    fontFamily: fontName,
                                    fontSize: 11,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Get.to(() => SignScreen()),
                                  child: Text(
                                    'Create Account',
                                    style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 11,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            MaterialButton(
                              height: 0,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              padding: const EdgeInsets.all(0),
                              minWidth: 0,
                              onPressed: () => _authController.signIn(),
                              child: Container(
                                width: Get.width,
                                padding: EdgeInsets.only(
                                  top: 13,
                                  bottom: 6,
                                ),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
