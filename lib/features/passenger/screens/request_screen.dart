import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_provider.dart';

class RequestScreen extends StatelessWidget {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await context.read<RideProvider>().createRequest(
                      pickupController.text,
                      phoneController.text,
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