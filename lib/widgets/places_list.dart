import 'package:favourite_places_app/screens/places_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places_app/models/placeclass.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class placeslist extends StatefulWidget {
  const placeslist({super.key, required this.places});
  final List<placeclass> places;

  @override
  State<placeslist> createState() => _placeslistState();
}

class _placeslistState extends State<placeslist> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.places.isEmpty) {
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
      itemCount: widget.places.length,
      itemBuilder: (context, index) => Slidable(
        direction: Axis.horizontal,
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) {
                setState(() {
                  widget.places.removeAt(index);
                });
              },
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              foregroundColor: Color.fromARGB(255, 255, 52, 52),
              icon: Icons.delete_forever_sharp,
              label: 'delete', borderRadius: BorderRadius.circular(0),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: /*this is an image provider whereas file.image() is a widget*/
                FileImage(widget.places[index].image),
          ),
          title: Text(
            widget.places[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => placedetail(place: widget.places[index]),
            ));
          },
        ),
      ),
    );
  }
}
