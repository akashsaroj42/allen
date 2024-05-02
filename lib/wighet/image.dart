// import 'package:animate_do/animate_do.dart';
// import 'package:chat_gpt/screen/homepage.dart';
// import 'package:chat_gpt/wighet/pallete.dart';
// import 'package:chat_gpt/wighet/rest.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final textController = TextEditingController();
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: BounceInDown(
//             child: const Text('Allen'),
//           ),
//           centerTitle: true,
//           backgroundColor:
//               const Color(0XFF9DB2BF), // Set your desired color here
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => homepage(title: 'Allen'),
//                 ),
//               );
//             },
//           ),
//         ),

//         backgroundColor: const Color(0XFF27374D),
//         body: Padding(
//           padding: const EdgeInsets.all(15.0),
//            child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Text(
//                       'Good Morning, what task can I do for you?',
//                       style: TextStyle(
//                         fontFamily: 'Cera Pro',
//                         color: Pallete.mainFontColor,
//                       ),
//                     ),
//                   ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: textController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your prompt',
//                   fillColor: Colors.white,
//                   filled: true,
//                   contentPadding: const EdgeInsets.all(16),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   labelStyle: const TextStyle(color: Colors.red),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: 150,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0XFF9DB2BF),
//                   ),
//                   onPressed: () {
//                     convertTextToImage(textController.text, context);
//                     setState(() {
//                       isLoading = true;
//                     });
//                   },
//                   child: isLoading
//                       ? const SizedBox(
//                           height: 15,
//                           width: 15,
//                           child: CircularProgressIndicator(color: Colors.black),
//                         )
//                       : const Text(
//                           'Generate Image',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:animate_do/animate_do.dart';
import 'package:chat_gpt/wighet/pallete.dart';
import 'package:chat_gpt/wighet/rest.dart';
import 'package:flutter/material.dart';

import 'package:chat_gpt/screen/homepage.dart'; // corrected typo in import path

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BounceInDown(
            child: const Text('Allen'),
          ),
          centerTitle: true,
          backgroundColor:
              const Color(0XFF9DB2BF), // Set your desired color here
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => homepage(
                      title: 'Allen'), // corrected to uppercase Homepage
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Pallete.borderColor, // corrected typo in Palette
                ),
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: Radius.zero,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Hey, What you like create today!!',
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        fontSize: 24, // Increase font size to 24
                        color:
                            Pallete.mainFontColor, // corrected typo in Palette
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter your prompt',
                  fillColor: Pallete.borderColor,
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF9DB2BF),
                ),
                onPressed: () {
                  convertTextToImage(textController.text, context);
                  setState(() {
                    isLoading = true;
                  });
                },
                child: isLoading
                    ? const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(color: Colors.black),
                      )
                    : const Text(
                        'Generate Image',
                        style: TextStyle(color: Colors.black),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
