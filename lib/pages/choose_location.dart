import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rt_pool/services/world_time-old.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'kolkata', flag: 'india.png', urlAtt: 'Asia/Kolkata'),
    WorldTime(urlAtt: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlAtt: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(
        urlAtt: 'Australia/Sydney', location: 'Sydney', flag: 'Australia.png'),
    WorldTime(urlAtt: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlAtt: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlAtt: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        urlAtt: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlAtt: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        urlAtt: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void UpdateTime(inde) async {
    WorldTime newTime = locations[inde];
    await newTime.getData();

    //navigate to home screen
    Navigator.pop(context, {
      'location': newTime.location,
      'flag': newTime.flag,
      'time': newTime.time,
      'isDaytime': newTime.isDaytime,
      'clientIp': newTime.clientIp,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  UpdateTime(index);

                  print(locations[index].location);
                  print(locations[index].urlAtt);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/info-box1.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
