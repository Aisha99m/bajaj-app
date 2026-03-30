import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createRide({
    required String pickup,
    required String time,
    required String phone,
    String? destination,
    String? notes,
  }) async {
    await _db.collection('ride_requests').add({
      'pickupLocation': pickup,
      'time': time,
      'passengerPhone': phone,
      'destination': destination ?? '',
      'notes': notes ?? '',
      'status': 'waiting',
      'driverPhone': null,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}