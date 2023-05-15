import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/controller/hotel/chatController.dart';

import '../../../constants.dart';
import '../../../controller/mainController.dart';

import '../../../utils/arCheck.dart';
import '../../../utils/convertToAgo.dart';

class ChatDetails extends StatelessWidget {
  ChatDetails({super.key});
  final ChatController _chatController = Get.find();
  final MainController _mainController = Get.find();
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
                'Chat',
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
              child: GetBuilder<ChatController>(
                  builder: (controller) => Stack(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: Get.height - (topPadding + (56)),
                              padding: const EdgeInsets.only(bottom: 80),
                              child: !_chatController.firstMessage
                                  ? _chatController.showMessage
                                      ? StreamBuilder(
                                          stream: _chatController.messages
                                              .where('messageListID',
                                                  isEqualTo:
                                                      _chatController.messageID)
                                              .orderBy('time',
                                                  descending: false)
                                              .limit(50)
                                              .snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            if (!snapshot.hasData) {
                                              return const SizedBox(
                                                height: 200,
                                                width: 200,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: kPrimaryColor),
                                                ),
                                              );
                                            }

                                            if (snapshot.hasData) {
                                              _chatController
                                                  .changeReadMessage();

                                              return ListView.builder(
                                                  controller: _chatController
                                                      .contactScrollController,
                                                  itemCount: snapshot
                                                      .data!.docs.length,
                                                  itemBuilder: (context, i) {
                                                    final messages =
                                                        snapshot.data!.docs;
                                                    return messageContaienr(
                                                        context,
                                                        messages[i]['message'],
                                                        messages[i]['time'],
                                                        !(messages[i]
                                                                ['sender'] ==
                                                            _chatController
                                                                .userID));
                                                  });
                                            }
                                            return const SizedBox();
                                          },
                                        )
                                      : SizedBox(
                                          height: 200,
                                          width: 200,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                                color: kPrimaryColor),
                                          ),
                                        )
                                  : const SizedBox()),
                          Positioned(
                            bottom: 0,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding * 1.5,
                                      vertical: kDefaultPadding / 2),
                                  width: Get.width,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(.8),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: TextFormField(
                                      style: const TextStyle(
                                          fontFamily: "tajawal",
                                          fontSize: 18,
                                          height: 1.7),
                                      onChanged: (value) {},
                                      maxLines: 3,
                                      minLines: 1,
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        fillColor: kThirdColor.withOpacity(.7),
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 1,
                                            top: 5,
                                            right: 8,
                                            left: 8),
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              _chatController.addNewMessage(),
                                          icon: Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                      ),
                                      controller:
                                          _chatController.messageController,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
            ),
          ),
        ),
      ),
    );
  }

  Row messageContaienr(BuildContext context, String message, time, sender) {
    return Row(
      mainAxisAlignment:
          sender ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 175),
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  message.trim(),

                  //    timeago.format(time),
                  softWrap: true,
                  textDirection: checkMessageLang(message)
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  style: const TextStyle(
                    height: 1.4,
                    fontFamily: "tajawal",
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding / 5,
                ),
                Text(
                  convertTimeToAgo(DateTime.parse(time.toDate().toString())),
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    height: 1.4,
                    fontFamily: "tajawal",
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  height: 4,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
