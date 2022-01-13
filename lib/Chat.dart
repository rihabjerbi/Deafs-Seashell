import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Chat extends StatefulWidget {
  @override
  _Chat createState() => _Chat();
}

class _Chat extends State<Chat> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  final auth = FirebaseAuth.instance;
  late ChatUser userChat = ChatUser();
  bool isUser=false;
  User? user;
  @override

  @override
  void initState() {
    user=auth.currentUser;
    super.initState();
    userChat = ChatUser(
      name: '${user!.displayName}',
      uid: user!.uid,
    );
  }



  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];
  var i = 0;
  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }
  void onSend(ChatMessage message) {
    print(message.toJson());
    FirebaseFirestore.instance
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());
    setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      theme: ThemeData(accentColor: Color(0xffDCCBC4)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("M E S S A G E S",style: TextStyle(fontSize: 24,fontFamily: 'Lato',color: Color(0xffDCCBC4),fontWeight: FontWeight.bold),),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),),
        ),



        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('messages')
                .orderBy("createdAt")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                );
              } else {
                List<DocumentSnapshot> items = snapshot.data!.docs;
                var messages = items.map((i) => ChatMessage.fromJson(i.data() as Map<String,dynamic>,)).toList();
                return DashChat(
                  key: _chatViewKey,
                  inverted: false,
                  onSend: onSend,
                  sendOnEnter: true,
                  textInputAction: TextInputAction.send,
                  user: userChat ,
                  inputDecoration:
                  InputDecoration.collapsed(hintText: "Add message here...",),
                  dateFormat: DateFormat('dd/MM/yyyy'),
                  timeFormat: DateFormat('HH:mm'),
                  messages: messages,
                  showUserAvatar: false,
                  showAvatarForEveryMessage: false,
                  scrollToBottom: true,
                  onPressAvatar: (ChatUser user) {
                    print("OnPressAvatar: ${user.name}");
                  },
                  onLongPressAvatar: (ChatUser user) {
                    print("OnLongPressAvatar: ${user.name}");
                  },
                  inputMaxLines: 10,
                  messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                  alwaysShowSend: false,
                  inputTextStyle: TextStyle(fontSize: 16.0,),
                  inputContainerStyle: BoxDecoration(
                    border: Border.all(width: 0.0),
                    color: Colors.white,
                  ),
                  onQuickReply: (Reply reply) {
                    setState(() {
                      messages.add(ChatMessage(
                          text: reply.value,
                          createdAt: DateTime.now(),
                          user: userChat ));

                      messages = [...messages];
                    });

                    Timer(Duration(milliseconds: 300), () {
                      _chatViewKey.currentState!.scrollController
                        ..animateTo(
                          _chatViewKey.currentState!.scrollController.position
                              .maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );

                      if (i == 0) {
                        systemMessage();
                        Timer(Duration(milliseconds: 600), () {
                          systemMessage();
                        });
                      } else {
                        systemMessage();
                      }
                    });
                  },
                  onLoadEarlier: () {
                    print("loading...");
                  },
                  shouldShowLoadEarlier: true,
                  showTraillingBeforeSend: true,

                );
              }
            }),
      ),
    );
  }
}