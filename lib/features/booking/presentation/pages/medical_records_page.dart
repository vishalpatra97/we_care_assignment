import 'package:flutter/material.dart';

class MedicalRecordsPage extends StatelessWidget {
  const MedicalRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: 4,
        padding: EdgeInsets.all(16),
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: FlutterLogo(size: 25),
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
                          Text('Cardiologist', style: TextStyle(fontSize: 14)),
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
                  Row(
                    children: [
                      SizedBox(width: 60),
                      SizedBox(width: 16),
                      Flexible(
                        child: Wrap(
                          runSpacing: 8,
                          spacing: 16,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "",
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.calendar_today_rounded,
                                      size: 15,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  TextSpan(text: " June 11, 2026"),
                                ],
                              ),
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "",
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.timer_outlined,
                                      size: 15,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  TextSpan(text: " 10:30 AM"),
                                ],
                              ),
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "",
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.location_on,
                                      size: 15,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  TextSpan(text: " In-Person"),
                                ],
                              ),
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).primaryColor.withAlpha(30),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Reschedule",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.withAlpha(30),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
