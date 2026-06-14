import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';

class DoctorSchedulePage extends StatelessWidget {
  const DoctorSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> filters = ["All (8)", "Pending (3)", "Done (3)"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Schedule"),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white.withAlpha(35)),
            child: Text("Tue, June 10"),
          ),
          VerticalDivider(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: false,
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            automaticallyImplyLeading: false,
            automaticallyImplyActions: false,
            pinned: true,
            toolbarHeight: 80,
            title: Container(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      filters[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.pushNamed(Routes.doctorAppointmentDetails),
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("11:00 AM"),

                        VerticalDivider(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Patient Name"),
                            SizedBox(height: 10),
                            Text(
                              "29M-ECG Pain - Follow-up-inperson",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green.withAlpha(35),
                              ),
                              child: Text(
                                "Record saved",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Text("Booked", style: TextStyle(color: Colors.amber)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
