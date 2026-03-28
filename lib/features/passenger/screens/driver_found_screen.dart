import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/ride_provider.dart';

class DriverFoundScreen extends StatelessWidget {
  const DriverFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RideProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Driver Found")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_taxi, size: 80),
            SizedBox(height: 20),
            Text("Driver Phone: ${provider.driverPhone ?? ''}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse("tel:${provider.driverPhone}"));
              },
              child: Text("Call Driver"),
            )
          ],
        ),
      ),
    );
  }
}