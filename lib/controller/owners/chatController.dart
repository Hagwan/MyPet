import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets/view/owner/chat/details.dart';

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
  TextEditingController messageController = TextEditingController();
  late List<QueryDocumentSnapshot> listDocs;
  late List<QueryDocumentSnapshot> listChats;
  String adminId = '';
  int aKind = 0;
  var chats = [];
  @override
  void onInit() {
    userID = storageInfo.read(userId);

    // getContactData();
    getChats();
    super.onInit();
  }

  openChatDetails(cId, kind) {
    adminId = cId;
    print(cId);
    aKind = kind;
    Get.to(() => ChatDetails());
    getContactData();
  }

  getChats() async {
    showChats = true;

    CollectionReference messageList =
        FirebaseFirestore.instance.collection('messageList');

    QuerySnapshot messageListQuerySnapshot = await messageList
        .where('owner', isEqualTo: userID)
        .orderBy('time', descending: true)
        .get();
    listChats = messageListQuerySnapshot.docs;

    if (listChats.isEmpty) {
      firstChat = true;
    } else {
      chats.clear();
      for (int x = 0; x < listChats.length; x++) {
        if (listChats[x]['aKind'] == 0) {
          await FirebaseFirestore.instance
              .collection('petcare')
              .doc(listChats[x]['admin'])
              .get()
              .then((value) {
            chats.add({
              'id': listChats[x].id,
              'aKind': listChats[x]['aKind'],
              'oRead': listChats[x]['oRead'],
              'admin': listChats[x]['admin'],
              'image': value['image'],
              'name': value['name'],
            });
          });
        } else {
          await FirebaseFirestore.instance
              .collection('hotel')
              .doc(listChats[x]['admin'])
              .get()
              .then((value) {
            chats.add({
              'id': listChats[x].id,
              'aKind': listChats[x]['aKind'],
              'oRead': listChats[x]['oRead'],
              'admin': listChats[x]['admin'],
              'image': value['image'],
              'name': value['name'],
            });
          });
        }
      }
    }
    showChats = true;
    update();
  }

  Future<void> getContactData() async {
    showMessage = false;
    CollectionReference messageList =
        FirebaseFirestore.instance.collection('messageList');

    QuerySnapshot messageListQuerySnapshot = await messageList
        .where('admin', isEqualTo: adminId)
        .where('owner', isEqualTo: userID)
        .get();
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
        "oRead": 1,
        "aRead": 0,
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
        'receiver': 0,
        'sender': userID,
        'time': DateTime.now()
      });
      messageController.text = "";
      CollectionReference MessageListRef =
          FirebaseFirestore.instance.collection("messageList");
      MessageListRef.doc(messageID).update(
          {"oRead": 1, 'aRead': 0, 'time': DateTime.now()}).then((value) {
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
        messageListReadRef.doc(messageID).update({'oRead': 1});
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
