import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/petCare/chatController.dart';

import '../../../../constants.dart';

Container ChatContainer() {
  final ChatController _chatController = Get.find();
  return Container(
    width: Get.width,
    height: Get.height - (prefSize + topPadding + 90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: kPrimaryColor.withOpacity(.4),
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          width: Get.width,
          height: Get.height - (prefSize + topPadding + 90),
          child: RefreshIndicator(
            onRefresh: () => _chatController.getChats(),
            child: ListView.separated(
              itemCount: _chatController.chats.length,
              itemBuilder: ((context, index) {
                return Container(
                  width: Get.width,
                  child: MaterialButton(
                    height: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.all(0),
                    minWidth: 0,
                    onPressed: () => _chatController
                        .openChatDetails(_chatController.chats[index]['owner']),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: .4, color: Colors.grey),
                              borderRadius: BorderRadius.circular(25)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              _chatController.chats[index]['image'],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: kDefaultPadding / 2,
                        ),
                        Text(
                          _chatController.chats[index]['name'],
                          style: const TextStyle(
                            height: 1.4,
                            fontFamily: "tajawal",
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        _chatController.chats[index]['aRead'] == 0
                            ? Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 15,
                  thickness: .4,
                  color: Colors.grey.withOpacity(.5),
                );
              },
            ),
          ),
        )
      ],
    ),
  );
}
