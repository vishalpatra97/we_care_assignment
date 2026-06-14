import 'package:flutter/material.dart';

class DoctorDashboardBox extends StatelessWidget {
  final String title;
  final String subTitle;
  const DoctorDashboardBox({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(subTitle, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
