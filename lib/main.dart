// import 'dart:io';
// import 'dart:js';
// import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rt_pool/pages/choose_location.dart';
import 'package:rt_pool/pages/loading.dart';
import 'package:rt_pool/pages/home.dart';

// backgroundColor: Colors.grey[900],
//         appBar:AppBar(
//           title: Text('Demo App'),
//           centerTitle: true,
//           backgroundColor: Colors.red[600],

 

void main() {
  runApp(MaterialApp( debugShowCheckedModeBanner: false,
  // initialRoute: '/home',
  routes: {
    '/':(context)=>Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>ChooseLocation(),
  },
   ));

   
}

