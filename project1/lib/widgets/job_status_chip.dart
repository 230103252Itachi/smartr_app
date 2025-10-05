import 'package:flutter/material.dart';

class JobStatusChip extends StatelessWidget {
  final String status;
  const JobStatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    Color c;
    IconData? icon;
    switch (status) {
      case "Applied":
        color = Color(0xFFFFFFFF);
        c = Color(0xFF07864B);
        icon = Icons.done;
        break;
      case "Expires Soon":
        color = Color(0xFFFFFFFF);
        c = Color(0xFFDAA400);
        icon = Icons.info;
        break;
      default:
        return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: c.withOpacity(1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Color(0xFFFFFFFF)),
          const SizedBox(width: 4),
          Text(status, style: TextStyle(color: color, fontSize: 10)),
        ],
      ),
    );
  }
}
