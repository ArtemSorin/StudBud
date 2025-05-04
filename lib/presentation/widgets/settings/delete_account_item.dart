import 'package:flutter/material.dart';

class DeleteAccountItem extends StatelessWidget {
  const DeleteAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
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
