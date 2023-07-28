import 'package:favourite_places_app/providers/managesuserplaces.dart';
import 'package:favourite_places_app/screens/add_places_screen.dart';
import 'package:favourite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class placesscreen extends ConsumerWidget {
  const placesscreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userplaces = ref.watch(userplacesprovider);

    return Scaffold(
      appBar: AppBar(
        title: Text("your places "),
        actions: [
          IconButton(
            onPressed: () {
              /*  showModalBottomSheet(
                context: context,
                builder: (context) => addplacescreen(),
              ); */
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => addplacescreen(),
              ));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: placeslist(
          places: userplaces,
        ),
      ),
    );
  }
}
