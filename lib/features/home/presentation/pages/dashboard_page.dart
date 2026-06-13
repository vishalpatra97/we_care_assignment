import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';
import 'package:we_care/features/home/presentation/widgets/appointment_card.dart';
import 'package:we_care/features/home/presentation/widgets/dashboard_appbar.dart';
import 'package:we_care/features/home/presentation/widgets/quick_action_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 16),
          Text(
            "Upcoming Appointments",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          AppointmentCard(),
          const SizedBox(height: 24),
          Text(
            "Quick Actions",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2.9,
            children: [
              QuickActionButton(
                label: "Find Doctors",
                icon: Icons.health_and_safety,
                color: Colors.green,
                onPressed: () {
                  context.pushNamed(Routes.findDoctors);
                },
              ),
              QuickActionButton(
                label: "Book Appointment",
                icon: Icons.calendar_today,
                color: Colors.indigoAccent,
              ),
              QuickActionButton(
                label: "Medical Records",
                icon: Icons.folder_open,
                color: Colors.purple,
              ),
              QuickActionButton(
                label: "Prescriptions",
                icon: Icons.receipt_long,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
