import 'dart:io';

import 'package:chat_gpt/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class SecondScreen extends StatefulWidget {
  final Uint8List image;
  const SecondScreen({super.key, required this.image});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF27374D),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 340,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.memory(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homepage(title: 'title'),
                    ),
                  );
                },
                child: RoundedContainerWithIcon(icon: Icons.home),
              ),
              GestureDetector(
  onTap: () async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/image.jpg');
    await file.writeAsBytes(widget.image);
    // Show a snackbar or toast indicating that the image has been downloaded
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Image downloaded to ${file.path}'),
    ));
  },
  child: RoundedContainerWithIcon(icon: Icons.save_alt_outlined),
),

              GestureDetector(
                onTap: () {
                  Share.share('Share yor picture');
                },
                child: RoundedContainerWithIcon(icon: Icons.share),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class RoundedContainerWithIcon extends StatelessWidget {
  final IconData icon;

  const RoundedContainerWithIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0XFF9DB2BF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 30,
          color: Colors.black, // Change the icon color as needed
        ),
      ),
    );
  }
}

