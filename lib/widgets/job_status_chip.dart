import 'package:flutter/material.dart';

class JobStatusChip extends StatelessWidget {
  final String status;
  const JobStatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case "Applied":
        color = Colors.green;
        break;
      case "Expiring":
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(status, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
