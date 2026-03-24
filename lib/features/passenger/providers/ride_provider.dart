import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RideProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String? requestId;
  String status = "idle";
  String? driverPhone;

  Future<void> createRequest(String pickup, String phone) async {
    final doc = await _db.collection('ride_requests').add({
      'pickupLocation': pickup,
      'passengerPhone': phone,
      'status': 'waiting',
      'driverPhone': null,
    });

    requestId = doc.id;
    status = "waiting";
    notifyListeners();

    listenToRequest();
  }

  void listenToRequest() {
    if (requestId == null) return;

    _db.collection('ride_requests').doc(requestId).snapshots().listen((doc) {
      if (!doc.exists) return;

      final data = doc.data()!;
      status = data['status'];

      if (status == "accepted") {
        driverPhone = data['driverPhone'];
      }

      notifyListeners();
    });
  }
}