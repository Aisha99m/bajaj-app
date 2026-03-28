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
    await _db.collection('rides').add({
      'pickup': pickup,
      'time': time,
      'phone': phone,
      'destination': destination ?? '',
      'notes': notes ?? '',
      'status': 'waiting',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}