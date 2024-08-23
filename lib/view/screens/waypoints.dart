import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hawkeyeapp/core/constants/app_colors.dart';
import 'package:hawkeyeapp/view/widgets/auth/auth_button.dart';
import '../widgets/auth/auth_textform.dart';

void sendWaypoint(double latitudeH, longitudeH, altitudeH, latitudeT,
    longitudeT, altitudeT) async {
  await deleteAllDocuments();
  FirebaseFirestore.instance.collection('waypoints').add({
    'home_latitude': latitudeH,
    'home_longitude': longitudeH,
    'home_altitude': altitudeH,
    'travel_latitude': latitudeT,
    'travel_longitude': longitudeT,
    'travel_altitude': altitudeT,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

Future<void> deleteAllDocuments() async {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('waypoints');
  QuerySnapshot querySnapshot = await collectionRef.get();
  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    await doc.reference.delete();
  }
}

class Waypoints extends StatelessWidget {
  final TextEditingController _latitudehomeController = TextEditingController();
  final TextEditingController _longitudehomeController =
      TextEditingController();
  final TextEditingController _altitudehomeController = TextEditingController();
  final TextEditingController _latitudetravelController =
      TextEditingController();
  final TextEditingController _longitudetravelController =
      TextEditingController();
  final TextEditingController _altitudetravelController =
      TextEditingController();
  Waypoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Send Waypoint'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(child: Container(height: 3, color: AppColors.primary)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  child: const Text("Home Location"),
                ),
                Expanded(child: Container(height: 3, color: AppColors.primary)),
              ],
            ),
            AuthTextForm(
              hintText: "Latitude (Home)",
              mycontroller: _latitudehomeController,
              icon: Icons.location_on,
              keyboardType: TextInputType.number,
            ),
            AuthTextForm(
              hintText: "Longitude (Home)",
              mycontroller: _longitudehomeController,
              icon: Icons.location_on,
              keyboardType: TextInputType.number,
            ),
            AuthTextForm(
              hintText: "altitude (Home)",
              mycontroller: _altitudehomeController,
              icon: Icons.location_on,
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(child: Container(height: 3, color: AppColors.primary)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  child: const Text("Travel Location"),
                ),
                Expanded(child: Container(height: 3, color: AppColors.primary)),
              ],
            ),
            AuthTextForm(
              hintText: "Latitude (Travel)",
              mycontroller: _latitudetravelController,
              icon: Icons.location_on,
              keyboardType: TextInputType.number,
            ),
            AuthTextForm(
              hintText: "Longitude (Travel)",
              mycontroller: _longitudetravelController,
              icon: Icons.location_on,
              keyboardType: TextInputType.number,
            ),
            AuthTextForm(
              hintText: "altitude (Travel)",
              mycontroller: _altitudetravelController,
              icon: Icons.location_on,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: Get.height * 0.05),
            AuthButton(
              text: "Send Waypoints",
              onPressed: () async {
                final latitudeH = double.parse(_longitudehomeController.text);
                final longitudeH = double.parse(_longitudehomeController.text);
                final altitudeH = double.parse(_altitudehomeController.text);
                final latitudeT = double.parse(_latitudetravelController.text);
                final longitudeT =
                    double.parse(_longitudetravelController.text);
                final altitudeT = double.parse(_altitudetravelController.text);
                sendWaypoint(latitudeH, longitudeH, altitudeH, latitudeT,
                    longitudeT, altitudeT);
                await Get.defaultDialog(
                  title: "Done",
                  content: const Text("Waypoints have been sent successfully"),
                );
                Get.toNamed("/video");
              },
            ),
          ],
        ),
      ),
    );
  }
}
