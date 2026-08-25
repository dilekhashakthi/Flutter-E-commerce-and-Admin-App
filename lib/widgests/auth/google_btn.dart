import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        padding: EdgeInsets.all(18),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(Ionicons.logoGoogle),
      label: Text("Sign in with google", style: TextStyle(color: Colors.black)),
      onPressed: () async {},
    );
  }
}
