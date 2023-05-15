import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/model/facts.dart';

import '../../api/api.dart';

class TipsControlller extends GetxController {
  // this line for initialize storage to store date for a long time
  var storageInfo = GetStorage();
//to store facts list
  List<Facts> FactList = [];

  @override
  void onInit() {
    getTips();
    super.onInit();
  }

  getTips() async {
    EasyLoading.show(status: "Please Wait");
    var response =
        await CallApi().getData("/facts", {'limit': '10', 'max_length': '140'});

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      FactList.addAll(FactsFromJson(jsonEncode(body['data'])));
      // print(body);
    }
    EasyLoading.dismiss();
    update();
  }
}
