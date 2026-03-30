import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Logger _logger = Logger();

  // Create or Update User Profile
  Future<void> saveUserProfile({
    required String uid,
    required String email,
    String? name,
    String? phone,
  }) async {
    try {
      await _db.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      _logger.e('Firestore Save User Error: $e');
      rethrow;
    }
  }

  // Get User Profile
  Future<DocumentSnapshot> getUserProfile(String uid) {
    return _db.collection('users').doc(uid).get();
  }

  // Update User Profile (Advanced)
  Future<void> updateUserProfile({
    required String uid,
    String? name,
    String? username,
    String? photoUrl,
  }) async {
    try {
      final updates = {
        if (name != null) 'name': name,
        if (username != null) 'username': username,
        if (photoUrl != null) 'photoUrl': photoUrl,
        'updatedAt': FieldValue.serverTimestamp(),
      };
      await _db.collection('users').doc(uid).update(updates);
      await logUserActivity(
        uid,
        'Profile Updated',
        details: 'Updated fields: ${updates.keys.join(', ')}',
      );
    } catch (e) {
      _logger.e('Firestore Update User Error: $e');
      rethrow;
    }
  }

  // Log User Activity
  Future<void> logUserActivity(
    String uid,
    String action, {
    String? details,
  }) async {
    try {
      await _db.collection('activity_logs').add({
        'uid': uid,
        'action': action,
        'details': details,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      _logger.e('Firestore Log Activity Error: $e');
    }
  }

  // Get Categories Stream
  Stream<QuerySnapshot> getCategories() {
    return _db.collection('categories').snapshots();
  }

  // Get Products Stream (Featured or by Category)
  Stream<QuerySnapshot> getProducts({String? category, bool? isFeatured}) {
    Query query = _db.collection('products');
    if (category != null && category != 'All') {
      query = query.where('category', isEqualTo: category);
    }
    if (isFeatured != null) {
      query = query.where('isFeatured', isEqualTo: isFeatured);
    }
    return query.snapshots();
  }
}
