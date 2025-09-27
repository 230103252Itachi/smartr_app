import 'package:flutter/material.dart';
import '../models/job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  const JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBFDBD1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(" "),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: _boxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        "assets/images/C.png",
                        width: 55,
                        height: 55,
                      ),
                    ),
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      job.company,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Posted on ${job.date}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: _boxDecoration(),
            child: Column(
              children: [
                _infoRow(
                  "APPLY BEFORE",
                  job.deadline,
                  "JOB NATURE",
                  job.type,
                  isChip: true,
                ),
                const SizedBox(height: 20),
                _infoRow(
                  "SALARY RANGE",
                  job.salary,
                  "JOB LOCATION",
                  job.location,
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: _boxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "JOB DESCRIPTION",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(job.description),
              ],
            ),
          ),

          const SizedBox(height: 6),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: _boxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ROLES AND RESPONSIBILITIES",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...job.responsibilities.map(
                    (r) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("• "),
                        Expanded(child: Text(r)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300.withOpacity(0.5),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _infoRow(
    String leftTitle,
    String leftValue,
    String rightTitle,
    String rightValue, {
    bool isChip = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _infoItem(leftTitle, leftValue, isChip: isChip),
        _infoItem(rightTitle, rightValue, isChip: isChip),
      ],
    );
  }

  Widget _infoItem(String title, String value, {bool isChip = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        isChip
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
