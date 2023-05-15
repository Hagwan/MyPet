import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/owners/homeController.dart';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

import '../../../../../constants.dart';

HomeController _homeController = Get.find();

final alarmtitle = TextEditingController();
TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
bool iosStyle = false;

void onTimeChanged(TimeOfDay newTime) {
  _time = newTime;
}

Container pets() {
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
              'pet profile',
              style: TextStyle(
                  fontFamily: fontName, fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              width: 30,
              child: MaterialButton(
                height: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                minWidth: 0,
                onPressed: () => _homeController.openNewPetPage(),
                child: Text(
                  '+',
                  style: TextStyle(
                      fontFamily: fontName, fontSize: 25, color: Colors.black),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        SizedBox(
          height: Get.height - (prefSize + topPadding + 310),
          child: ListView.builder(
              itemCount: _homeController.petList.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 150,
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding),
                      decoration: BoxDecoration(
                        color: kSecondColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: .6),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 5,
                            spreadRadius: .5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.black, width: .3),
                            ),
                            child: Image.asset(
                              _homeController.petList[index]['kind'] == 0
                                  ? 'assets/images/cat.png'
                                  : 'assets/images/dog.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          SizedBox(
                            width: kDefaultPadding,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: kDefaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_homeController.petList[index]['name']}',
                                  style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                  '${_homeController.petList[index]['gender']}',
                                  style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 13,
                                      color: kPrimaryColor),
                                ),
                                Text(
                                  '${_homeController.petList[index]['breed']}',
                                  style: TextStyle(
                                      fontFamily: fontName,
                                      fontSize: 13,
                                      color: kPrimaryColor),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              MaterialButton(
                                height: 0,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: const EdgeInsets.all(0),
                                minWidth: 0,
                                onPressed: () =>
                                    _homeController.preparePetToEdit(index),
                                child: Icon(
                                  Icons.edit_document,
                                  color: kPrimaryColor,
                                  size: 25,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                  ],
                );
              })),
        ),
        Container(
          width: Get.width,
          height: 150,
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: .6),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: .5,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(8),
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: .3),
                  ),
                  child: Icon(
                    Icons.alarm,
                    size: 50,
                  )),
              SizedBox(
                width: kDefaultPadding,
              ),
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alarm",
                      style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Builder(builder: (context) {
                return Column(
                  children: [pets1(context)],
                );
              })
            ],
          ),
        ),
      ],
    ),
  );
}

final _formKey = GlobalKey<FormState>();

@override
Widget pets1(BuildContext context) {
  return Center(
    child: MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: Get.width,
                height: Get.height,
                child: AlertDialog(
                  content: SingleChildScrollView(
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: Stack(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Center(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const SizedBox(height: 10),
                                          Container(
                                            child: TextField(
                                              controller: alarmtitle,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter The Title',
                                                border: OutlineInputBorder(),
                                                labelText: 'Alarm Title',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: createInlinePicker(
                                              elevation: 1,
                                              value: _time,
                                              onChange: onTimeChanged,
                                              dialogInsetPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 24.0),
                                              minuteInterval:
                                                  MinuteInterval.FIVE,
                                              iosStylePicker: iosStyle,
                                              minHour: 0,
                                              okText: "okay",
                                              cancelText: "",
                                              maxHour: 23,
                                              is24HrFormat: false,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(5),
                                                child: OutlinedButton(
                                                  child: const Text(
                                                    'Create alarm',
                                                    style: TextStyle(
                                                        fontSize: 10.0),
                                                  ),
                                                  onPressed: () {
                                                    FlutterAlarmClock
                                                        .createAlarm(_time.hour,
                                                            _time.minute,
                                                            title: alarmtitle
                                                                .text);
                                                  },
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.all(5),
                                                child: OutlinedButton(
                                                  child: const Text(
                                                    'Show alarms',
                                                    style: TextStyle(
                                                        fontSize: 10.0),
                                                  ),
                                                  onPressed: () {
                                                    FlutterAlarmClock
                                                        .showAlarms();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      height: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
      minWidth: 0,
      child: Icon(
        Icons.alarm_add,
        color: kPrimaryColor,
        size: 25,
      ),
    ),
  );
}
