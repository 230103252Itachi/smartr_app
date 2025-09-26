import 'package:flutter/material.dart';
import '../models/job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  const JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              job.company,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Salary: ${job.salary}"),
                SizedBox(width: 20),
                Text("Location: ${job.location}"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(job.description),
          ],
        ),
      ),
    );
  }
}
