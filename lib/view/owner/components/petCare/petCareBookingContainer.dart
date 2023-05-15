import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/petController.dart';
import 'package:pets/utils/times.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants.dart';

final PetController _petController = Get.find();

Container petCareBookingContainer() {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: kDefaultPadding,
    ),
    child: GetBuilder<PetController>(
        init: PetController(),
        builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.black, width: .6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.network(
                          _petController.petCareForBooking[0]['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _petController.petCareForBooking[0]['name'],
                            style: TextStyle(
                                fontFamily: fontName,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: Get.width * .54,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: kPrimaryColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        _petController.petCareForBooking[0]
                                            ['address'],
                                        style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.all(0),
                                minWidth: 0,
                                onPressed: () async {
                                  String _url = _petController
                                      .petCareForBooking[0]['map'];
                                  if (!await launchUrl(Uri.parse(_url))) {}
                                },
                                child: Text(
                                  "Map",
                                  style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 13,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Which pet',
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _petController.dropValue,
                    items: _petController.dropValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _petController.dropChangedValue(value);
                    },
                  ),
                ),
                GetBuilder<PetController>(
                    init: PetController(),
                    builder: (controller) => Container(
                          height: Get.height - (prefSize + 90 + 235),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Days',
                                  style: TextStyle(
                                      fontFamily: fontName, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: Get.width,
                                  height: 50,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _petController.dayList.length,
                                      itemBuilder: ((context, index) {
                                        return MaterialButton(
                                          height: 0,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          padding: const EdgeInsets.all(0),
                                          minWidth: 0,
                                          onPressed: () =>
                                              _petController.selectDay(index),
                                          child: Container(
                                            width: 60,
                                            height: 50,
                                            margin: EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                                color: _petController
                                                            .daySelected ==
                                                        _petController
                                                            .dayList[index]
                                                            .toString()
                                                    ? kPrimaryColor
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kDefaultPadding / 2),
                                                border: Border.all(width: .7)),
                                            child: Center(
                                                child: Text(
                                              _petController.dayList[index]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: fontName,
                                                  height: 2,
                                                  color: _petController
                                                              .daySelected ==
                                                          _petController
                                                              .dayList[index]
                                                              .toString()
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 18),
                                            )),
                                          ),
                                        );
                                      })),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Appointment Time',
                                  style: TextStyle(
                                      fontFamily: fontName, fontSize: 18),
                                ),
                                Container(
                                  height: 220,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisExtent: 52,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 20),
                                    itemCount: times.length,
                                    itemBuilder: ((context, index) {
                                      //  !_petController.timeBooking
                                      //

                                      return _petController.timeBooking
                                              .where((element) =>
                                                  element['time'] ==
                                                  "${times[index]['time'].toString()} ${times[index]['for'].toString()}")
                                              .isEmpty
                                          ? Container(
                                              padding: EdgeInsets.only(top: 7),
                                              decoration: BoxDecoration(
                                                  color: times[index]
                                                              ['selected'] ==
                                                          1
                                                      ? kPrimaryColor
                                                      : Colors.transparent,
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: .7),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: MaterialButton(
                                                height: 0,
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.all(0),
                                                minWidth: 0,
                                                onPressed: () => _petController
                                                    .selectTime(index),
                                                child: Column(children: [
                                                  Text(
                                                    '${times[index]['time']}',
                                                    style: TextStyle(
                                                        fontFamily: fontName,
                                                        fontSize: 15,
                                                        color: times[index][
                                                                    'selected'] ==
                                                                1
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                  Text(
                                                    '${times[index]['for']}',
                                                    style: TextStyle(
                                                        fontFamily: fontName,
                                                        fontSize: 15,
                                                        color: times[index][
                                                                    'selected'] ==
                                                                1
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                ]),
                                              ),
                                            )
                                          : SizedBox();
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultPadding / 2,
                                ),
                                TextFormField(
                                  controller: _petController.noteController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: fontName,
                                    height: 2,
                                  ),
                                  cursorHeight: 27,
                                  maxLines: 3,
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

                                      hintText: 'Note',
                                      hintStyle: const TextStyle(
                                        height: 2,
                                        fontFamily: fontName,
                                        fontSize: 16,
                                        color: Color(0xffA9A9A9),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: const EdgeInsets.only(
                                          top: 0, right: 10, left: 10)),
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                        )),
                SizedBox(
                  height: kDefaultPadding,
                ),
                MaterialButton(
                  height: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                  onPressed: () => _petController.checkBooking(),
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
                      'Booking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            )),
  );
}
