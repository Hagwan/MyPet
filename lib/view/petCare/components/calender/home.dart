import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../controller/petCare/calController.dart';
import '../../../../utils/times.dart';

final CalenderController _calenderController = Get.find();

Container calenderHome() {
  return Container(
    width: Get.width,
    height: Get.height - 90,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          'Days',
          style: TextStyle(fontFamily: fontName, fontSize: 18),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: Get.width,
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _calenderController.dayList.length,
              itemBuilder: ((context, index) {
                return MaterialButton(
                  height: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                  onPressed: () => _calenderController.selectDay(index),
                  child: Container(
                    width: 60,
                    height: 50,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: _calenderController.daySelected ==
                                _calenderController.dayList[index].toString()
                            ? kPrimaryColor
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(kDefaultPadding / 2),
                        border: Border.all(width: .7)),
                    child: Center(
                        child: Text(
                      _calenderController.dayList[index].toString(),
                      style: TextStyle(
                          fontFamily: fontName,
                          height: 2,
                          color: _calenderController.daySelected ==
                                  _calenderController.dayList[index].toString()
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
          'Times',
          style: TextStyle(fontFamily: fontName, fontSize: 18),
        ),
        Container(
          height: 220,
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 52,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20),
            itemCount: times.length,
            itemBuilder: ((context, index) {
              //  !_calenderController.timeBooking
              //

              return _calenderController.timeBooking
                      .where((element) =>
                          element['time'] ==
                          "${times[index]['time'].toString()} ${times[index]['for'].toString()}")
                      .isEmpty
                  ? Container(
                      padding: EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                          color: times[index]['selected'] == 1
                              ? kPrimaryColor
                              : Colors.transparent,
                          border: Border.all(color: Colors.black, width: .7),
                          borderRadius: BorderRadius.circular(8)),
                      child: MaterialButton(
                        height: 0,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.all(0),
                        minWidth: 0,
                        //  onPressed: () => _calenderController.selectTime(index),
                        onPressed: () {},
                        child: Column(children: [
                          Text(
                            '${times[index]['time']}',
                            style: TextStyle(
                                fontFamily: fontName,
                                fontSize: 15,
                                color: times[index]['selected'] == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            '${times[index]['for']}',
                            style: TextStyle(
                                fontFamily: fontName,
                                fontSize: 15,
                                color: times[index]['selected'] == 1
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
      ],
    ),
  );
}
