import 'package:agro_finder_project/presentation/labour/wallet/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobCardScreen extends StatefulWidget {
  @override
  State<JobCardScreen> createState() => _JobCardScreenState();
}

class _JobCardScreenState extends State<JobCardScreen> {
  final JobController jobController = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jobs")),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: jobController.jobList.length,
          itemBuilder: (context, index) {
            final job = jobController.jobList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Color(0xFFB6D3CC),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${job.name}"),
                        Text("Job Description: ${job.description}"),
                        Text("Job Status: ${job.status}"),
                        Text("Date: ${job.date}"),
                        Text("Duration of Job: ${job.duration}"),
                        Text("Expected Money: ${job.money}"),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(Icons.download, color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
