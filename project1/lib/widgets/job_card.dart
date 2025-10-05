import 'package:flutter/material.dart';
import '../models/job.dart';
import 'job_status_chip.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onTap;

  const JobCard({required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/images/C.png",
            width: 35,
            height: 35,
            fit: BoxFit.cover,
          ),
        ),

        title: Text(
          job.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFF0D0D0D),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.company,
              style: TextStyle(fontSize: 12, color: Color(0xFF434545)),
            ),
            const SizedBox(height: 4),
            Container(
              width: 70,
              padding: const EdgeInsets.symmetric(vertical: 7),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFBFDBD1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Paystack",
                style: TextStyle(fontSize: 12, color: Color(0xFF53595F)),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JobStatusChip(status: job.status),
            SizedBox(height: 14),
            Text(
              job.salary,
              style: TextStyle(fontSize: 12, color: Color(0xFF434545)),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
