import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app/models/product.dart';

class CartItem {
  final Product product;
  int quantity;
  final String selectedSize;

  CartItem({
    required this.product,
    this.quantity = 1,
    required this.selectedSize,
  });
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product, {int quantity = 1, String size = 'M'}) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id && item.selectedSize == size,
    );

    if (existingIndex != -1) {
      final newState = [...state];
      newState[existingIndex].quantity += quantity;
      state = newState;
    } else {
      state = [
        ...state,
        CartItem(product: product, quantity: quantity, selectedSize: size),
      ];
    }
  }

  void removeFromCart(String productId, String size) {
    state = state
        .where(
          (item) =>
              !(item.product.id == productId && item.selectedSize == size),
        )
        .toList();
  }

  void updateQuantity(String productId, String size, int delta) {
    state = [
      for (final item in state)
        if (item.product.id == productId && item.selectedSize == size)
          CartItem(
            product: item.product,
            quantity: (item.quantity + delta).clamp(1, 99),
            selectedSize: item.selectedSize,
          )
        else
          item,
    ];
  }

  void clearCart() {
    state = [];
  }

  double get subtotal =>
      state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
