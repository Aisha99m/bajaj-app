import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'features/passenger/screens/request_screen.dart';
import 'features/passenger/screens/searching_screen.dart';
import 'features/passenger/screens/driver_found_screen.dart';
import 'features/passenger/providers/ride_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RideProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bajaj App',
        initialRoute: '/',
        routes: {
          '/': (context) => RequestScreen(),
          '/searching': (context) => SearchingScreen(),
          '/found': (context) => DriverFoundScreen(),
        },
      ),
    );
  }
}