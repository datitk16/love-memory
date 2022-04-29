import 'package:flutter/material.dart';
import 'package:love_memory/data/image.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          setState(() {
            if (dragEndDetails.primaryVelocity! < 0) {
              // Page forwards
              buildNextImage();
            } else if (dragEndDetails.primaryVelocity! > 0) {
              // Page backwards
              buildPreviousImage();
            }
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(CardData().cardImageUrl[currentSelected]),
            ),
          ),
        ),
      ),
    );
  }
}
