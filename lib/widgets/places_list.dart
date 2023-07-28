import 'package:favourite_places_app/screens/places_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places_app/models/placeclass.dart';

class placeslist extends StatelessWidget {
  const placeslist({super.key, required this.places});
  final List<placeclass> places;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (places.isEmpty) {
      return Center(
        child: Text(
          "no places added",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: /*this is an image provider whereas file.image() is a widget*/
              FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => placedetail(place: places[index]),
          ));
        },
      ),
    );
  }
}
