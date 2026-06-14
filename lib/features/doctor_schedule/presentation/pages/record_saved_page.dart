import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class RecordSavedPage extends StatelessWidget {
  const RecordSavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),

        children: [
          SafeArea(child: SizedBox.shrink(), bottom: false),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.green.withAlpha(40),
              child: Icon(
                Icons.file_download_done_rounded,
                color: Colors.green,
                size: 75,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Record Saved!",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "Consultation notes for Vishal Patra have been saved to the medical record and shared with the patient.!",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("PATIENT"),
                    subtitle: Text("Patient Name - 30M"),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today_rounded),
                    title: Text("DATE"),
                    subtitle: Text("Tuesday. June 10, 2026"),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer_outlined),
                    title: Text("TIME"),
                    subtitle: Text("10:30 AM"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("TYPE"),
                    subtitle: Text("In-Person · Apollo Hospital"),
                  ),
                  ListTile(
                    leading: Icon(Icons.tag),
                    title: Text("REF NO"),
                    subtitle: Text("#WC-2026-04821"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.go(Routes.doctorDashboard);
            },
            child: Text("Back To Dashboard"),
          ),
          SafeArea(top: false, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
