import 'package:calendar_day_slot_navigator/calendar_day_slot_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class SelectSlotPage extends StatefulWidget {
  const SelectSlotPage({super.key});

  @override
  State<SelectSlotPage> createState() => _SelectSlotPageState();
}

class _SelectSlotPageState extends State<SelectSlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Slot'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                elevation: 0,
                color: Theme.of(context).primaryColor.withAlpha(20),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Row(
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
                        "₹1500",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              CalendarDaySlotNavigator(
                slotLength: 6,
                dayBoxHeightAspectRatio: 5,
                dayDisplayMode: DayDisplayMode.inDateBox,
                deActiveColor: const Color(0xffffffff),
                monthYearTabBorderRadius: 15,
                dayBoxBorderRadius: 10,
                headerText: "Select Date",
                onDateSelect: (selectedDate) {},
                dateSelectionType: DateSelectionType.activeTodayAndFutureDates,

                rangeDates: [
                  DateTime(2026, 6, 9),
                  DateTime(2026, 6, 6),
                  DateTime(2026, 6, 8),
                ],
                fontFamilyName: "Lato", // Set custom fonts or google fonts name
                isGoogleFont: true, // Set true for google fonts
                dayBorderWidth: 0.5, // Set day box border width
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                height: 125,
                width: double.infinity,
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Selected: ",
                        children: [
                          TextSpan(
                            text: "Tue, June 10 - 10:30 AM",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(Routes.confirmBooking);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Confirm Booking',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
