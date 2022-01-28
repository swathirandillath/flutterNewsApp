import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final titles = [
    "Last Roman Amphitheater, Regrowing Frog Legs, Mechanical Trees and More Mysterious News Briefly — January 27, 2022",
    "Wall Street Breakfast: RIP Diem",
    "After Twitter interaction between Elon Musk, McDonald’s, rise of new crypto ‘Grimace Coin",
    "Futures little changed following Fed's hawkish stance",
    "Toyota heading to moon with cruiser, robotic arms, dreams",
    "Exclusive: Tesla Australia sales in 2021 revealed state by state",
    "Toyota heading to moon with cruiser, robotic arms, dreams",
    "Elon Musk offered teen 5K to shut down Twitter account tracking his private flights: report",
    "Apple Lifts Futures; Tesla Plunge Signals End For These Stocks - Investor's Business Daily",
    "China sponsors punish Australian Open for Peng Shuai stance"
  ];

  final icons = [Icons.notifications_active, Icons.notifications_active,
    Icons.notifications_active, Icons.notifications_active, Icons.notifications_active,
    Icons.notifications_active, Icons.notifications_active, Icons.notifications_active,
    Icons.notifications_active,Icons.notifications_active,Icons.notifications_active];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card( //                           <-- Card widget
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
          ),
        );
      },
    );
  }
}