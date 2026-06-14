import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class DoctorAppointmentCard extends StatelessWidget {
  const DoctorAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TODAY - 10:30 AM",
                  style: TextStyle(color: Colors.white70),
                ),
                Text("In-Person", style: TextStyle(color: Colors.white70)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white.withAlpha(100),
                  child: Icon(
                    Icons.monitor_heart_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient Name",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                    Text(
                      "30M-Followup-Chest Pain",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        context.pushNamed(Routes.doctorAppointmentDetails),
                    child: Text("View Details"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(100),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Start"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
