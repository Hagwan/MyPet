import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../../../../../controller/mainController.dart';

import '../../../../controller/petCare/homeController.dart';

class HomePetCareContainer extends StatelessWidget {
  HomePetCareContainer({super.key});
  final PetCareHomeController _homeController =
      Get.put(PetCareHomeController());

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(
        textScaleFactor: mqData.textScaleFactor > 5.0 ? 5.0 : 1.1);
    return MediaQuery(
      data: mqDataNew,
      child: GetBuilder<MainController>(
        builder: (Controller) => Scaffold(
          body: GetBuilder<PetCareHomeController>(
              builder: (mController) => Container(
                    height: Get.height,
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        Text(
                          'Bookings',
                          style: TextStyle(fontFamily: fontName, fontSize: 25),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        _homeController.showBooking
                            ? Container(
                                height: Get.height - (prefSize + 200),
                                width: Get.width,
                                child: ListView.builder(
                                    itemCount:
                                        _homeController.bookingList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: Get.width,
                                        margin: EdgeInsets.only(
                                            top: kDefaultPadding / 2),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding,
                                            vertical: kDefaultPadding),
                                        height: 260,
                                        decoration: BoxDecoration(
                                            color: kSecondColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: kSecondColor,
                                                offset: const Offset(
                                                  2.0,
                                                  1.0,
                                                ),
                                                blurRadius: 5.0,
                                                spreadRadius: 1.0,
                                              ), //BoxShadow
                                            ],
                                            border: Border.all(
                                                width: .7,
                                                color: Colors.grey
                                                    .withOpacity(.7))),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _homeController
                                                            .bookingList[index]
                                                        ['petName'] ??
                                                    '',
                                                style: TextStyle(
                                                    fontFamily: fontName,
                                                    color: Colors.black,
                                                    fontSize: 21),
                                              ),
                                              Text(
                                                '(NOTE)',
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontFamily: fontName,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: Get.width,
                                                height: 60,
                                                child: Text(
                                                  _homeController.bookingList[
                                                          index]['note'] ??
                                                      '',
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.clip,
                                                      color: kPrimaryColor,
                                                      fontFamily: fontName,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Booking: ${_homeController.bookingList[index]['dateDay'] ?? ''}',
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontFamily: fontName,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Time: ${_homeController.bookingList[index]['dateTime'] ?? ''} - ${_homeController.bookingList[index]['dateTimeTo'] ?? ''}',
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontFamily: fontName,
                                                    fontSize: 17),
                                              ),
                                              Center(
                                                child: MaterialButton(
                                                  height: 0,
                                                  splashColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  minWidth: 0,
                                                  onPressed: () {
                                                    _homeController.bookingList[
                                                                    index]
                                                                ['confirm'] ==
                                                            0
                                                        ? _homeController
                                                            .changeConfirmStatus(
                                                                _homeController
                                                                        .bookingList[
                                                                    index]['id'],
                                                                index)
                                                        : null;
                                                  },
                                                  child: Container(
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                        color: _homeController
                                                                            .bookingList[
                                                                        index][
                                                                    'confirm'] ==
                                                                0
                                                            ? Colors.blue[700]
                                                            : Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Center(
                                                      child: Text(
                                                        _homeController.bookingList[
                                                                        index][
                                                                    'confirm'] ==
                                                                0
                                                            ? 'Confirm'
                                                            : 'Confirmed',
                                                        style: TextStyle(
                                                            height: 1.8,
                                                            color: Colors.white,
                                                            fontFamily:
                                                                fontName,
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      );
                                    }),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
