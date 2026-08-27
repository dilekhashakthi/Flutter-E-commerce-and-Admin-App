import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  final String label;

  const GoogleButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        padding: const EdgeInsets.all(18),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Ionicons.logoGoogle),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      onPressed: () async {},
    );
  }
}
