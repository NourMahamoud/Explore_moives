import 'dart:io';

import 'package:flutter/material.dart';
class Networkhandle_erorrs {
   static Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Error '),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Check your InterNet Please To continue to app'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                exit( 0) ;
              },
            ),
            TextButton(onPressed: (){
              Navigator.of(context).pop() ;
            }, child: Text('Open Wifi'))
          ],
        );
      },
    );
  }
}