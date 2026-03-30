import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import '../models/product.dart';
import '../models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('--- Starting Database Seeding ---');

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase Initialized');

    final db = FirebaseFirestore.instance;

    // 1. Seed Categories
    print('Seeding Categories...');
    for (var category in mockCategories) {
      await db.collection('categories').doc(category.id).set({
        'id': category.id,
        'name': category.name,
      });
    }
    print('✅ Categories Seeded: ${mockCategories.length}');

    // 2. Seed Products
    print('Seeding Products...');
    for (var product in mockProducts) {
      await db.collection('products').doc(product.id).set({
        'id': product.id,
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'category': product.category,
        'rating': product.rating,
        'isFeatured': product.isFeatured,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
    print('✅ Products Seeded: ${mockProducts.length}');

    print('--- Seeding Complete! ---');
  } catch (e) {
    print('❌ Seeding Error: $e');
  }
}
