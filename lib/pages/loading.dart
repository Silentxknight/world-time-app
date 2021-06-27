import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:rt_pool/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time='loading';

  // var url=Uri.parse("https://worldtimeapi.org/api/timezone/Asia/Kolkata"); 

  void setupWorldTime()async{
   WorldTime wt= WorldTime(location: 'kolkata',flag: 'india.png',urlAtt: 'Asia/Kolkata');
   await wt.getData();
   print("offi:  "+wt.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDaytime':wt.isDaytime,
      'clientIp':wt.clientIp,
    });
  //  setState(() {
  //    time=wt.time;
  //  });
    
 }

  void initState(){
    
    super.initState();
    
    setupWorldTime();
     
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [],
      elevation: 0.0,
      backgroundColor: Colors.black,),
      // backgroundColor: Colors.grey[900],
         backgroundColor: Colors.black,   
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                
                 Center(child: 
         SpinKitSquareCircle(
        // color: Colors.red,
           color:Colors.black,
           size: 30.0,
        
        // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
        ),),
        // SizedBox(height: 0,),
        Image(image: AssetImage('assets/images/Globe Hour.png'),height: 300,),
        


      ],),
    );
  }
}
