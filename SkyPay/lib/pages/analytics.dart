import 'dart:math';

import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  final Random random = Random();
  final int totalFlights = 25;

  int get totalFlightTime {
    int totalTime = 0;
    for (int i = 0; i < totalFlights; i++) {
      totalTime += random.nextInt(7) + 1;
    }
    return totalTime;
  }

  int get flightsThisMonth {
    int count = 0;
    for (int i = 0; i < totalFlights; i++) {
      DateTime flightDate =
          DateTime.now().subtract(Duration(days: random.nextInt(30)));
      if (flightDate.month == DateTime.now().month) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Analiz'),
          backgroundColor: Color(0x0ff023240),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 20.0),
                    _buildCard(
                      title: 'Toplam Uçuş Süresi',
                      subtitle: '$totalFlightTime saat',
                      icon: Icons.timer,
                      iconColor: Colors.deepPurpleAccent,
                    ),
                    SizedBox(height: 20.0),
                    _buildCard(
                      title: 'Bu Ay Yapılan Uçuş Sayısı',
                      subtitle: '$flightsThisMonth uçuş',
                      icon: Icons.local_airport,
                      iconColor: Colors.deepPurpleAccent,
                    ),
                    SizedBox(height: 20.0),
                    _buildCard(
                      title: 'Son Uçuş',
                      subtitle:
                          '${DateTime.now().subtract(Duration(days: random.nextInt(30)))}',
                      icon: Icons.flight_takeoff,
                      iconColor: Colors.deepPurpleAccent,
                    ),
                    SizedBox(height: 20.0),
                    _buildCard(
                      title: 'En Uzun Uçuş',
                      subtitle: '${random.nextInt(8) + 1} saat',
                      icon: Icons.timeline,
                      iconColor: Colors.deepPurpleAccent,
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      {required String title,
      required String subtitle,
      required IconData icon,
      required Color iconColor}) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16.0),
        ),
        leading: Icon(
          icon,
          color: iconColor,
          size: 35.0,
        ),
      ),
    );
  }
}
