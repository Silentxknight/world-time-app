// import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {
    // Getting the data
   data= data.isNotEmpty?data : ModalRoute.of(context).settings.arguments;

   print(data);
   Color bgColor=data['isDaytime']?Colors.cyanAccent[100]:Colors.grey[900];  
   Color fontColor=data['isDaytime']?Colors.black:Colors.white;
   var timeIcon=data['isDaytime']?'sun.png':'moon.png'; 

    return Scaffold(
      // backgroundColor: bgColor,
      backgroundColor: bgColor,
      body: SafeArea(
        child:Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Column(children: [
            Container(  color:Colors.black,
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        
                          child: FlatButton.icon(
                onPressed: ()async{
                dynamic result= await Navigator.pushNamed(context, "/location");
                // Navigator.pushNamed(context, "/location");
                // 
                //updation data Map
               setState(() {
                 
                  data={
                  'location': result['location'],
                  'flag':result['flag'],
                  'time':result['time'],
                  'isDaytime':result['isDaytime'],
                  'clientIp':result['clientIp'],
                };
                print('widget uodated');

                


               });

               print(data['client_Ip']);
                


                },
                 icon: Icon(Icons.edit_location,color: fontColor,), label: Text('Edit Location',style: TextStyle(color: fontColor),)),
            ),
              SizedBox(height: 20.0,),
              Image(image: AssetImage('assets/images/$timeIcon'),fit: BoxFit.contain,height: 90.0,),

              SizedBox(height:20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image(image: AssetImage('assets/images/de-skull.jpg'),fit: BoxFit.contain,height: 40.0,),

                  SizedBox(height:20.0),

                  Text(
                    data['location'].toString().toUpperCase(),
                    style: TextStyle(fontSize: 28.0,letterSpacing: 2.0,color: fontColor,fontWeight: FontWeight.w400,),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0,color: fontColor,fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.0,),
              Container(
                
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.deepOrangeAccent,  borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  "Your IP : "+ data['clientIp'],
                  style: TextStyle(fontSize: 16.0,color: fontColor,),
                ),
              ),
              SizedBox(height: 40.0,),
              Container( color: Colors.purple,
                              child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Row( mainAxisAlignment:MainAxisAlignment.center, children: [
                    Image(image: AssetImage('assets/images/github.png',),height: 60,),
                    Text('github.com/Silentxknight',style: TextStyle(fontSize: 20,color: Colors.black, ))
                  ],),
                ),
              )
          ],),
        ) 
        ),
    );
  }
}

