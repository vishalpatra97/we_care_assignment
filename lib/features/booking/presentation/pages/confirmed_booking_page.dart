import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class ConfirmBookingPage extends StatelessWidget {
  const ConfirmBookingPage({super.key});

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
              child: Icon(Icons.check, color: Colors.green, size: 75),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Booking Confirmed!",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "Your appointment has been successfully booked. A confirmation has been sent to your email.!",
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
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: FlutterLogo(size: 30),
                      ),
                      SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Jane Doe',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Cardiologist: In-Person',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "Confirmed",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
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
          OutlinedButton(onPressed: () {}, child: Text("View My Appointments")),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.go(Routes.dashboard);
            },
            child: Text("Back To Home"),
          ),
          SafeArea(child: SizedBox.shrink(), top: false),
        ],
      ),
    );
  }
}
