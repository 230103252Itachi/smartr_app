import 'package:flutter/material.dart';
import '../models/job.dart';
import '../widgets/job_card.dart';
import 'job_detail_screen.dart';

class JobsListScreen extends StatelessWidget {
  final List<Job> jobs = [
    Job(
      title: "Junior UX Designer",
      company: "Canva",
      salary: "\$40–60k/yearly",
      status: "Open",
      location: "Remote",
      description: "Can you bring creative human-centered ideas to life ...",
      category: "Designer",
    ),
    Job(
      title: "Junior Product Designer",
      company: "Canva",
      salary: "\$40–60k/yearly",
      status: "Applied",
      location: "Remote",
      description: "We believe in teamwork, fun, complex projects ...",
      category: "Designer",
    ),
    Job(
      title: "Middle Motion Designer",
      company: "Canva",
      salary: "\$40–60k/yearly",
      status: "Expiring",
      location: "Remote",
      description: "We’re looking for a like-minded motion designer ...",
      category: "Designer",
    ),
    Job(
      title: "Junior Android developer",
      company: "Kotlin, Java",
      salary: "\$40–60k/yearly",
      status: "Open",
      location: "Remote",
      description: "Can you bring creative human-centered ideas to life ...",
      category: "Android",
    ),
    Job(
      title: "Middle Android developer",
      company: "Kotlin, Java",
      salary: "\$40–60k/yearly",
      status: "Expiring",
      location: "Remote",
      description: "We believe in teamwork, fun, complex projects ...",
      category: "Android",
    ),
    Job(
      title: "Junior UX Designer",
      company: "Kotlin, Java",
      salary: "\$40–60k/yearly",
      status: "Expiring",
      location: "Remote",
      description: "We’re looking for a like-minded motion designer ...",
      category: "Android",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Job>> groupedJobs = {};
    for (var job in jobs) {
      groupedJobs.putIfAbsent(job.category, () => []).add(job);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFBFDBD1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                ClipOval(
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Image.asset(
                      "assets/images/l.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.notifications_none,
                  color: Color(0xFF434545),
                  size: 33,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: groupedJobs.entries.map((entry) {
                  final category = entry.key;
                  final jobsInCategory = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          category.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF434545),
                          ),
                        ),
                      ),

                      ...jobsInCategory.map(
                        (job) => JobCard(
                          job: job,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JobDetailScreen(job: job),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// echo "# test_app" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/230103252Itachi/test_app.git
// git push -u origin main