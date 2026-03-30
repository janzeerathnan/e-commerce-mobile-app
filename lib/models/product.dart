class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final bool isFeatured;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.rating = 0.0,
    this.isFeatured = false,
  });
}

// Mock Data
final List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Silk Evening Gown',
    description:
        'A luxurious silk gown for special occasions. Handcrafted with precision.',
    price: 299.00,
    imageUrl:
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=1964&auto=format&fit=crop',
    category: 'Dresses',
    rating: 4.8,
    isFeatured: true,
  ),
  Product(
    id: '2',
    name: 'Tailored Blazer',
    description:
        'Perfectly fitted blazer for a professional look. Premium wool blend.',
    price: 159.00,
    imageUrl:
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=2072&auto=format&fit=crop',
    category: 'Outerwear',
    rating: 4.5,
    isFeatured: true,
  ),
  Product(
    id: '3',
    name: 'Cashmere Sweater',
    description: 'Ultra-soft cashmere sweater for maximum comfort and style.',
    price: 120.00,
    imageUrl:
        'https://images.unsplash.com/photo-1576566588028-4147f3842f27?q=80&w=1964&auto=format&fit=crop',
    category: 'Tops',
    rating: 4.9,
    isFeatured: false,
  ),
  Product(
    id: '4',
    name: 'Leather Handbag',
    description:
        'Spacious and elegant leather handbag. Genuine Italian leather.',
    price: 210.00,
    imageUrl:
        'https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=1935&auto=format&fit=crop',
    category: 'Accessories',
    rating: 4.7,
    isFeatured: true,
  ),
];
