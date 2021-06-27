import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'quote.dart';


class QuoteCard extends StatelessWidget {
  Quote quote;
  Function delete;
  QuoteCard({this.quote, this.delete});
  // const QuoteCard({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(quote.text,
          style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 6.0,),
          Text(
            quote.author,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 8.0,),
          FlatButton.icon(
            onPressed: delete,
            label: Text('Delete Quote'),
            icon: Icon(Icons.delete),
          )

        ],),
      ),
      // child: ,
    );
  }
}