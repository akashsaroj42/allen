import 'package:chat_gpt/screen/homepage.dart';
import 'package:flutter/material.dart';

import 'mybot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 29, 206, 177)),            
        useMaterial3: true,
      ),
      home: homepage(title: 'Allen'),
    );
  }
}
