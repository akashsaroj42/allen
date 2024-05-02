import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';

import 'package:chat_gpt/mybot.dart';
import 'package:chat_gpt/screen/second_screen.dart';
import 'package:chat_gpt/wighet/feature.dart';
import 'package:chat_gpt/wighet/image.dart';
import 'package:chat_gpt/wighet/pallete.dart';
import 'package:chat_gpt/wighet/rest.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int start = 200;
  int delay = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Allen'),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // virtual assistant picture
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assests/logo.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble
            FadeInRight(
              child: Visibility(
                
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Pallete.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Good Morning, what task can I do for you?',
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Pallete.mainFontColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Two buttons side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ChatBot(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    primary:
                        const Color.fromARGB(255, 79, 99, 208), // Cool color
                  ),
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Chat',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    primary: const Color.fromARGB(
                        255, 17, 194, 176), // Another cool color
                  ),
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Image',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SlideInLeft(
              child: Visibility(
                // visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 22),
                  child: const Text(
                    'Here are a few features',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // features list
            Visibility(
              // visible: generatedContent == null && generatedImageUrl == null,
              child: Column(
                children: [
                  SlideInLeft(
                    delay: Duration(milliseconds: start),
                    child: const FeatureBox(
                      color: Pallete.firstSuggestionBoxColor,
                      headerText: 'Gemini',
                      descriptionText:
                          'A smarter way to stay organized and informed with Gemini',
                    ),
                  ),
                  SlideInRight(
                    delay: Duration(milliseconds: start + delay),
                    child: const FeatureBox(
                      color: Pallete.secondSuggestionBoxColor,
                      headerText: 'Stability AI',
                      descriptionText:
                          'Get inspired and stay creative with your personal assistant powered by Stability AI',
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + 2 * delay),
                    child: const FeatureBox(
                      color: Pallete.thirdSuggestionBoxColor,
                      headerText: 'Smart Assistant',
                      descriptionText:
                          'Get the best of both worlds with a assistant powered by Gemini and Stability AI',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
