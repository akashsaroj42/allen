

import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:chat_gpt/screen/homepage.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser muself = ChatUser(id: "1", firstName: "Akash");
  ChatUser bot = ChatUser(id: "2", firstName: "Allen");
  List<ChatMessage> allMassages = [];
  List<ChatUser> typing = [];

  final ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCaqeMCEQtRU5CYDgonEttfluNO2OaljoU";
  final header = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typing.add(bot);
    allMassages.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(ourUrl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result["candidates"][0]["content"]["parts"][0]["text"]);
        ChatMessage m1 = ChatMessage(
          user: bot,
          createdAt: DateTime.now(),
          text: result["candidates"][0]["content"]["parts"][0]["text"],
        );
        allMassages.insert(0, m1);
      } else {
        print("Error occurred");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const  Text('Allen'),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,// Set your desired color here
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => homepage(title: 'Allen'),
              ),
            );
          },
        ),
      ),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assests/logo.png'), // Provide your image path here
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey), // Set border color here
            ),
            child: DashChat(
              messageOptions: MessageOptions(
                showTime: true,
                textColor: Colors.white,
                containerColor: Colors.grey.shade700,
              ),
              typingUsers: typing,
              currentUser: muself,
              onSend: (ChatMessage m) {
                getData(m);
              },
              messages: allMassages,
            ),
          ),
        ),
      ),
    );
  }
}
