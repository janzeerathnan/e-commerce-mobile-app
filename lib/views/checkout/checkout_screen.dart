import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/app_theme.dart';
import 'package:e_commerce_app/views/main_navigation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'CHECKOUT',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildStepIndicator(),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _currentStep == 0
                  ? _buildShippingForm()
                  : _buildPaymentForm(),
            ),
          ),
          _buildBottomAction(),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          _buildStepCircle(0, 'Shipping'),
          Expanded(child: Container(height: 1, color: Colors.grey[300])),
          _buildStepCircle(1, 'Payment'),
        ],
      ),
    );
  }

  Widget _buildStepCircle(int step, String label) {
    final isActive = _currentStep >= step;
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? AppTheme.primaryBlue : Colors.white,
            border: Border.all(
              color: isActive ? AppTheme.primaryBlue : Colors.grey[300]!,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${step + 1}',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SHIPPING ADDRESS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 20),
        const TextField(decoration: InputDecoration(hintText: 'Full Name')),
        const SizedBox(height: 16),
        const TextField(decoration: InputDecoration(hintText: 'Email Address')),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(hintText: 'Street Address'),
        ),
        const SizedBox(height: 16),
        const TextField(decoration: InputDecoration(hintText: 'City')),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: 'State')),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: 'ZIP Code'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PAYMENT METHOD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 20),
        _buildPaymentOption('Credit Card', Icons.credit_card, true),
        const SizedBox(height: 12),
        _buildPaymentOption('Apple Pay', Icons.apple, false),
        const SizedBox(height: 12),
        _buildPaymentOption('PayPal', Icons.payment, false),
        const SizedBox(height: 30),
        const TextField(decoration: InputDecoration(hintText: 'Card Number')),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: 'Expiry Date (MM/YY)'),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(decoration: InputDecoration(hintText: 'CVV')),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String label, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey[300]!,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.black),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          if (isSelected)
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            if (_currentStep == 0) {
              setState(() => _currentStep = 1);
            } else {
              _showSuccessDialog();
            }
          },
          child: Text(_currentStep == 0 ? 'NEXT STEP' : 'PLACE ORDER'),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 24),
              const Text(
                'ORDER PLACED!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your order has been placed successfully. We will notify you once it is shipped.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MainNavigationScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('BACK TO HOME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
