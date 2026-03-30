import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;

  Category({required this.id, required this.name, required this.icon});
}

// Mock Data
final List<Category> mockCategories = [
  Category(id: '1', name: 'All', icon: Icons.grid_view_rounded),
  Category(id: '2', name: 'Dresses', icon: Icons.checkroom_rounded),
  Category(id: '3', name: 'Tops', icon: Icons.dry_cleaning_rounded),
  Category(id: '4', name: 'Shoes', icon: Icons.ice_skating_rounded),
  Category(id: '5', name: 'Accessories', icon: Icons.watch_rounded),
];
