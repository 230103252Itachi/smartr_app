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
      description: "Bring creative, human-centered ideas to life.",
      date: "03 March, 2022",
      deadline: "03 June, 2022",
      type: "Full-time",
      responsibilities: [
        "Assist in creating wireframes and prototypes",
        "Support senior designers in user research",
        "Collaborate with developers for design implementation",
      ],
      category: "Designer",
    ),
    Job(
      title: "Android Developer",
      company: "Google",
      salary: "\$70–90k/yearly",
      status: "Applied",
      location: "Mountain View, CA",
      description: "Develop high-quality Android apps with Kotlin and Java.",
      date: "15 April, 2022",
      deadline: "15 July, 2022",
      type: "Full-time",
      responsibilities: [
        "Build and maintain Android applications",
        "Write clean and efficient Kotlin/Java code",
        "Work with UI/UX designers for smooth interfaces",
      ],
      category: "Designer",
    ),
    Job(
      title: "Backend Engineer",
      company: "Amazon",
      salary: "\$90–120k/yearly",
      status: "Open",
      location: "Seattle, WA",
      description: "Work on backend services powering millions of users.",
      date: "20 May, 2022",
      deadline: "20 August, 2022",
      type: "Full-time",
      responsibilities: [
        "Develop scalable REST APIs",
        "Optimize database queries",
        "Ensure system security and reliability",
      ],
      category: "Designer",
    ),
    Job(
      title: "iOS Developer",
      company: "Apple",
      salary: "\$80–100k/yearly",
      status: "Expires Soon",
      location: "Cupertino, CA",
      description: "Develop next-gen iOS applications with Swift.",
      date: "01 June, 2022",
      deadline: "01 September, 2022",
      type: "Full-time",
      responsibilities: [
        "Build iOS apps using Swift and SwiftUI",
        "Integrate APIs and services",
        "Fix bugs and optimize performance",
      ],
      category: "Designer",
    ),
    Job(
      title: "Frontend Developer",
      company: "Facebook (Meta)",
      salary: "\$75–95k/yearly",
      status: "Open",
      location: "Remote",
      description: "Create fast and responsive web applications.",
      date: "10 March, 2022",
      deadline: "10 June, 2022",
      type: "Full-time",
      responsibilities: [
        "Build UI with React.js",
        "Ensure cross-browser compatibility",
        "Work with designers and backend engineers",
      ],
      category: "Android",
    ),
    Job(
      title: "Data Scientist",
      company: "Netflix",
      salary: "\$100–130k/yearly",
      status: "Applied",
      location: "Los Angeles, CA",
      description:
          "Analyze data to improve user experience and recommendations.",
      date: "12 April, 2022",
      deadline: "12 July, 2022",
      type: "Full-time",
      responsibilities: [
        "Analyze user behavior data",
        "Build machine learning models",
        "Prepare data visualizations",
      ],
      category: "Android",
    ),
    Job(
      title: "DevOps Engineer",
      company: "Spotify",
      salary: "\$85–110k/yearly",
      status: "Open",
      location: "Stockholm, Sweden",
      description: "Maintain CI/CD pipelines and cloud infrastructure.",
      date: "25 May, 2022",
      deadline: "25 August, 2022",
      type: "Full-time",
      responsibilities: [
        "Automate deployments with CI/CD",
        "Monitor system performance",
        "Work with AWS and Docker",
      ],
      category: "Android",
    ),
    Job(
      title: "QA Tester",
      company: "Ubisoft",
      salary: "\$50–70k/yearly",
      status: "Expires Soon",
      location: "Paris, France",
      description: "Test and improve the quality of AAA games.",
      date: "30 May, 2022",
      deadline: "30 June, 2022",
      type: "Contract",
      responsibilities: [
        "Execute test cases on game builds",
        "Report and track bugs",
        "Collaborate with developers for fixes",
      ],
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
