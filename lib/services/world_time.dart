import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String urlAtt;
  bool isDaytime;
  String clientIp;

  WorldTime({this.location, this.urlAtt});

  void getData() async {
    // var url=Uri.parse("https://worldtimeapi.org/api/timezone/");
    var url = Uri.parse("https://app-vison.herokuapp.com/asia/kolkata");

    Response respons =
        // await get(Uri.parse("https://worldtimeapi.org/api/timezone/$urlAtt"));
        await get(Uri.parse("https://app-vison.herokuapp.com/asia/kolkata"));
    // await get(Uri.parse("http://localhost:3000/asia/kolkata"));

    print(respons.headers);
    print(respons.headers['date']);

    Map data = jsonDecode(respons.body);
    print('server data:');
    print(data);

    // clientIp = data['client_ip'];
    //  datetime = data['date'];
    // String offset = data['time'].substring(1, 3);
    //? free quota eneded
    // time = data['time'];
    time = '08:36:10';
    isDaytime = true;
    //  String client_ip=data['client_ip'];
    // print(clientIp);

    // DateTime now = DateTime.parse(datetime).toLocal();
    // print(now);

    // now=now.add(Duration(hours: int.parse(offset)));
    // print(now);
    //setting time property
    // time= now.toString();

    // isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    // time = DateFormat.jm().format(now);

    // print(time);
  }
}

// WorldTime wt= WorldTime(location: 'berlin',flag: 'germany.png',urlAtt: 'Asia/Kolkata');
