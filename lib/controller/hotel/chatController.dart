import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/view/hotel/chat/details.dart';

import '../../constants.dart';

class ChatController extends GetxController {
  var storageInfo = GetStorage();

  bool firstMessage = true;
  bool firstChat = true;
  String messageID = "";

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  bool showMessage = false;
  bool showChats = false;
  ScrollController contactScrollController = ScrollController();
  String userID = "";
  String userHotelID = "";
  TextEditingController messageController = TextEditingController();
  late List<QueryDocumentSnapshot> listDocs;
  late List<QueryDocumentSnapshot> listChats;
  String adminId = '';
  int aKind = 0;
  var chats = [];
  @override
  void onInit() {
    userID = storageInfo.read(userId);
    userHotelID = storageInfo.read(userHotelId);

    // getContactData();
    getChats();
    super.onInit();
  }

  openChatDetails(cId) {
    adminId = cId;
    Get.to(() => ChatDetails());
    getContactData();
  }

  getChats() async {
    showChats = true;

    CollectionReference messageList =
        FirebaseFirestore.instance.collection('messageList');

    QuerySnapshot messageListQuerySnapshot = await messageList
        .where('admin', isEqualTo: userHotelID)
        .orderBy('time', descending: true)
        .get();
    listChats = messageListQuerySnapshot.docs;

    if (listChats.isEmpty) {
      firstChat = true;
    } else {
      chats.clear();
      for (int x = 0; x < listChats.length; x++) {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(listChats[x]['owner'])
            .get()
            .then((value) {
          chats.add({
            'id': listChats[x].id,
            'aRead': listChats[x]['aRead'],
            'owner': listChats[x]['owner'],
            'image': value['kind'] == 0
                ? "assets/images/man.png"
                : "assets/images/girl.png",
            'name': value['firstName'] + " " + value['lastName'],
          });
        });
      }
    }
    showChats = true;
    update();
  }

  Future<void> getContactData() async {
    showMessage = false;
    CollectionReference messageList =
        FirebaseFirestore.instance.collection('messageList');

    QuerySnapshot messageListQuerySnapshot =
        await messageList.where('admin', isEqualTo: userHotelID).get();
    listDocs = messageListQuerySnapshot.docs;

    if (listDocs.isEmpty) {
      firstMessage = true;
    } else {
      messageID = listDocs[0].id;
      firstMessage = false;
    }
    showMessage = true;
    update();
  }

  addNewMessage() async {
    if (firstMessage) {
      CollectionReference messageListRef =
          FirebaseFirestore.instance.collection("messageList");
      messageListRef.add({
        "oRead": 0,
        "aRead": 1,
        'owner': userID,
        'admin': adminId,
        'aKind': aKind,
        'time': DateTime.now()
      }).then((doc) {
        firstMessage = false;
        messageID = doc.id;

        CollectionReference messageRef =
            FirebaseFirestore.instance.collection("messages");
        messageRef.add({
          "message": messageController.text,
          "messageListID": messageID,
          'sender': userID,
          'time': DateTime.now()
        });
        messageController.text = "";
        getChats();
        update();
      }).catchError((error) {
        print(error);
      });
    } else {
      CollectionReference MessageRef =
          FirebaseFirestore.instance.collection("messages");
      MessageRef.add({
        "message": messageController.text,
        "messageListID": messageID,
        'sender': userID,
        'time': DateTime.now()
      });
      messageController.text = "";
      CollectionReference MessageListRef =
          FirebaseFirestore.instance.collection("messageList");
      MessageListRef.doc(messageID).update(
          {"oRead": 0, 'aRead': 1, 'time': DateTime.now()}).then((value) {
        getChats();

        update();
      });
      // Timer(
      //   Duration(milliseconds: 500),
      //   () => _controller.jumpTo(_controller.position.maxScrollExtent),
      // );

    }
    update();
  }

  changeReadMessage() {
    showMessage = true;
    Timer(
      const Duration(milliseconds: 200),
      () {
        CollectionReference messageListReadRef =
            FirebaseFirestore.instance.collection("messageList");
        messageListReadRef.doc(messageID).update({'aRead': 1});
        contactScrollController.animateTo(
          contactScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeOut,
        );
        // contactScrollController
        //     .jumpTo(contactScrollController.position.maxScrollExtent);
      },
    );
  }
}
