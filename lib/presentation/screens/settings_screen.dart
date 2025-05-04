import 'package:flutter/material.dart';

import '../widgets/settings/delete_account_item.dart';
import '../widgets/settings/settings_header.dart';
import '../widgets/settings/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            SettingsHeader(),
            SizedBox(height: 16),
            SettingsItem(icon: Icons.notifications, title: 'Уведомления'),
            Divider(),
            SettingsItem(icon: Icons.person, title: 'Аккаунт'),
            SettingsItem(icon: Icons.palette, title: 'Внешний вид'),
            SettingsItem(icon: Icons.settings, title: 'Приложение'),
            SettingsItem(icon: Icons.privacy_tip, title: 'Приватность'),
            Divider(),
            SettingsItem(icon: Icons.account_balance_wallet, title: 'Баланс'),
            SettingsItem(icon: Icons.help, title: 'Поддержка'),
            SettingsItem(icon: Icons.info, title: 'О приложении'),
            SizedBox(height: 24),
            DeleteAccountItem(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
