import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 16),
            _buildSettingsItem(Icons.notifications, 'Уведомления', () {}),
            const Divider(),
            _buildSettingsItem(Icons.person, 'Аккаунт', () {}),
            _buildSettingsItem(Icons.palette, 'Внешний вид', () {}),
            _buildSettingsItem(Icons.settings, 'Приложение', () {}),
            _buildSettingsItem(Icons.privacy_tip, 'Приватность', () {}),
            const Divider(),
            _buildSettingsItem(Icons.account_balance_wallet, 'Баланс', () {}),
            _buildSettingsItem(Icons.help, 'Поддержка', () {}),
            _buildSettingsItem(Icons.info, 'О приложении', () {}),
            const SizedBox(height: 24),
            _buildDeleteAccountItem(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
        const SizedBox(height: 10),
        const Text(
          'Анна Асоль',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        const Text('+7 ••• ••• •• 43', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDeleteAccountItem() {
    return ListTile(
      leading: const Icon(Icons.delete_outline, color: Colors.red),
      title: const Text(
        'Удалить аккаунт',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      ),
      onTap: () {},
    );
  }
}
