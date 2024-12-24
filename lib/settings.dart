import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Переход к экрану настроек уведомлений
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.color_lens,
            title: 'App Theme',
            onTap: () {
              // Переход к экрану настроек темы приложения
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.language,
            title: 'App Language',
            onTap: () {
              // Переход к экрану настроек языка приложения
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.lock,
            title: 'Access Settings',
            onTap: () {
              // Переход к экрану настроек доступа
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.delete,
            title: 'Delete Account',
            onTap: () {
              // Подтверждение удаления аккаунта
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.info,
            title: 'About App',
            onTap: () {
              // Переход к экрану "О приложении"
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.support,
            title: 'Support',
            onTap: () {
              // Переход к экрану поддержки
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
