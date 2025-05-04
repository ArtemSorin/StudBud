import 'package:flutter/material.dart';

class InterestChips extends StatelessWidget {
  final List<String> interests;

  const InterestChips({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children:
          interests
              .map(
                (interest) => Chip(
                  label: Text(interest),
                  backgroundColor: Colors.black,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              )
              .toList(),
    );
  }
}
