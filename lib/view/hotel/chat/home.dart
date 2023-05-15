import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controller/hotel/chatController.dart';
import '../../../controller/mainController.dart';
import '../components/chat/homeContainer.dart';

class ChatHotelHome extends StatelessWidget {
  ChatHotelHome({super.key});
  final ChatController _chatController = Get.put(ChatController());

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
            child: GetBuilder<ChatController>(
                builder: (mController) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ChatContainer()],
                    )),
          ),
        ),
      ),
    );
  }
}
