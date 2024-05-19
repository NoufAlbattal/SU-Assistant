import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
//import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:http/http.dart' as http;

// import 'models/chatMessageModel.dart';


class chat_page extends StatefulWidget {
  @override
  _chat_pageState createState() => _chat_pageState();
}

class _chat_pageState extends State<chat_page> {
  final messageController = TextEditingController();
  bool isdesable = true;
  List<ChatMessage> _messages = [];
//  final _user = const types.User(
//     id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
//   );
  //  final _assistant = const types.User(
  //   id: 'AI',
  // );
  void _disable(){
    setState(() {
      isdesable = !isdesable;
    });
  }
  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.insert(0,message);
      // _messages.add(message);
    });
    print(_messages);
  }
  // void _handleSendPressed(types.PartialText message) {
  // // final newMessage = types.TextMessage(
  // //   author: _user,
  // //   id: 'User',
  // //   text: message.text,
  // // );
  //   // _addMessage(newMessage);
  // _handleresponse(message.text);
  // // _postData(message.text);
  // // print(newMessage);

  // }
//     Future<void> _postData(String message) async {
//   final url = Uri.parse('https://test.fahadalsubaihi.xyz/ask/'); //Repclace Your Endpoint
//   final headers = {'Content-Type': 'application/json'};
//   final body = jsonEncode({'query': message});

//   final response = await http.post(url, headers: headers, body: body);

//   if (response.statusCode == 200) {
//     print('Data Sending Success.');
//   } else {
//     print('Hata: ${response.statusCode}');
//   }
// }

  Future<void> _handleresponse(String message) async {
    final url = Uri.parse('https://test.fahadalsubaihi.xyz/ask/'); //Repclace Your Endpoint
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'query': message});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      _addMessage(ChatMessage(messageContent: utf8.decode(response.bodyBytes), messageType: "receiver"));

      //  _addMessage(types.TextMessage(
      //       author: _assistant,
      //       id: 'AI',
      //       text: utf8.decode(response.bodyBytes),
      //     ));
      // print(response.bodyBytes);
    } else {
      _addMessage(ChatMessage(messageContent: utf8.decode(response.bodyBytes), messageType: "receiver"));

      //  _addMessage(types.TextMessage(
      //   author: _assistant,
      //   id: 'ERROR',
      //   text: response.body,
      // ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions:[Image.asset(
            "images/AI.png",width: 60,
          )],
          title: Text("Virtual academic advisor"),
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          //scrolledUnderElevation: 0,
          //surfaceTintColor: Colors.transparent,
          leading:
          BackButton(
            color: Colors.black,
          )

      ),
      body:  Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60,bottom: 20),
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true,
              shrinkWrap: true,
              // padding: EdgeInsets.only(top: 60,bottom: 10),
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (_messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.green[200]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(_messages[index].messageContent, style: TextStyle(fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
              height: 60,
              // width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        suffixIcon:    IconButton(
                          onPressed: isdesable && !messageController.text.isNotEmpty?(){
                            _addMessage(ChatMessage(messageContent: messageController.text, messageType: "sender"));
                            _disable();
                            _handleresponse(messageController.text).then((value) {
                              messageController.clear();
                              _disable();
                            } );
                            // print(messageController.text);

                          }:null,
                          icon: Icon(Icons.send,color: Colors.black54,size: 25,),
                          // backgroundColor: Colors.white,
                          // elevation: 0,
                        ),
                      ),

                    ),
                  ),
                  // SizedBox(width: 15,),
                  //  IconButton(
                  //   onPressed: (){},
                  //   icon: Icon(Icons.send,color: Colors.black54,size: 25,),
                  //   // backgroundColor: Colors.white,
                  //   // elevation: 0,
                  // ),
                ],

              ),
            ),
          ),
        ],
      ),
      // Chat(
      //   messages: _messages,
      //   // onAttachmentPressed: _handleAttachmentPressed,
      //   // onMessageTap: _handleMessageTap,
      //   // onPreviewDataFetched: _handlePreviewDataFetched,
      //   onSendPressed: _handleSendPressed,
      //   // showUserAvatars: true,
      //   // showUserNames: true,
      //   user: _user,
      //   theme: const DefaultChatTheme(
      //     seenIcon: Text(
      //       'read',
      //       style: TextStyle(
      //         fontSize: 10.0,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}