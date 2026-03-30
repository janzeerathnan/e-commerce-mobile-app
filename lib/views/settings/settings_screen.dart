import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          'SETTINGS',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSettingsSection('ACCOUNT'),
          _buildSettingsItem(
            Icons.person_outline,
            'Account Information',
            () {},
          ),
          _buildSettingsItem(Icons.lock_outline, 'Password & Security', () {}),
          const SizedBox(height: 32),
          _buildSettingsSection('NOTIFICATIONS'),
          _buildSettingsItem(
            Icons.notifications_none,
            'Push Notifications',
            () {},
          ),
          _buildSettingsItem(
            Icons.email_outlined,
            'Email Notifications',
            () {},
          ),
          const SizedBox(height: 32),
          _buildSettingsSection('APP SETTINGS'),
          _buildSettingsItem(Icons.language_outlined, 'Language', () {}),
          _buildSettingsItem(Icons.dark_mode_outlined, 'Dark Mode', () {}),
          _buildSettingsItem(Icons.help_outline, 'Help & Support', () {}),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppTheme.primaryBlue, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.grey,
      ),
    );
  }
}
