import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomTab({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
