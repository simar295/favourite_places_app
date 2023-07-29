import 'package:favourite_places_app/models/placeclass.dart';
import 'package:flutter/material.dart';

class placedetail extends StatelessWidget {
  const placedetail({super.key, required this.place});

  final placeclass place;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ), //stack starts with the bottom most first
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
