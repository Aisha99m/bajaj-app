import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_provider.dart';
import '../../../services/firestore_service.dart';

class RequestScreen extends StatelessWidget {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final firestore = FirestoreService();
  RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Request Bajaj")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: pickupController,
              decoration: InputDecoration(labelText: "Pickup Location"),
            ),

             TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: "Pickup Time"),
            ),

            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            SizedBox(height: 20),
          

ElevatedButton(
  onPressed: () async {
    await firestore.createRide(
      pickup: pickupController.text,
      time: timeController.text,
      phone: phoneController.text,
    );

    Navigator.pushNamed(context, '/searching');
        },
      child: Text("Request Bajaj"),
          )
          ],
        ),
      ),
    );
  }
}