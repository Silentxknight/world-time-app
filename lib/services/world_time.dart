import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String urlAtt;
  bool isDaytime;
  String clientIp;
  WorldTime({this.location,this.flag,this.urlAtt});
  




  void getData() async{
  var url=Uri.parse("https://worldtimeapi.org/api/timezone/"); 
   
   
   Response respons= await get(Uri.parse("https://worldtimeapi.org/api/timezone/$urlAtt"));
  //  Response respons= await get(Uri.parse("https://worldtimeapi.org/api/timezone$urlAtt"));

   Map data= jsonDecode(respons.body);

   clientIp=data['client_ip'];
   String datetime=data['datetime'];
   String offset = data['utc_offset'].substring(1,3);
  //  String client_ip=data['client_ip'];
  
     print(clientIp);
   
    DateTime now= DateTime.parse(datetime).toLocal();
    print(now);
    
    // now=now.add(Duration(hours: int.parse(offset)));
    // print(now);
    //setting time property
    // time= now.toString();
      
    isDaytime=now.hour>6 && now.hour<20 ? true:false ;
    time=DateFormat.jm().format(now);
      
    print(time);

  }


}

// WorldTime wt= WorldTime(location: 'berlin',flag: 'germany.png',urlAtt: 'Asia/Kolkata');