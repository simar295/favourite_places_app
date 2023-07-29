import 'package:flutter/material.dart';
import 'package:location/location.dart';

class locationinput extends StatefulWidget {
  const locationinput({super.key});

  @override
  State<locationinput> createState() => _locationinputState();
}

class _locationinputState extends State<locationinput> {
  Location? pickedlocation;

  var isgettinglocation = false;

////////////////////////////////////////////////////

  void getcurrentlocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      isgettinglocation = true;
    });

    locationData = await location.getLocation();

    setState(() {
      isgettinglocation = false;
    });
    print(locationData.latitude);
    print(locationData.longitude);
  }

/////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    Widget previewcontent = Text(
      "no location choosed",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    );

    if (isgettinglocation) {
      previewcontent = CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: previewcontent),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextButton.icon(
            onPressed: getcurrentlocation,
            icon: Icon(Icons.location_on),
            label: Text(
              "get current location",
              style: TextStyle(fontSize: 10),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.map),
            label: Text(
              "select on map",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ]),
      ],
    );
  }
}
