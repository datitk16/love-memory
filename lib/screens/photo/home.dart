import 'package:flutter/material.dart';
import 'package:love_memory/data/image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void buildNextImage() {
    setState(() {
      CardData().nextImage();
    });
  }

  void buildPreviousImage() {
    setState(() {
      CardData().previousImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                          CardData().cardImageUrl[currentSelected]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 500,
                  width: MediaQuery.of(context).size.width - 2 * 54,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
