import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_provider.dart';

class SearchingScreen extends StatelessWidget {
  const SearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RideProvider>();

    if (provider.status == "accepted") {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/found'));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Finding nearby driver...")
          ],
        ),
      ),
    );
  }
}