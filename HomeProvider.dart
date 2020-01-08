
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:trano/models/Immovable.dart';
import 'package:trano/models/User.dart';
import 'package:trano/ressources/Api.dart';
import 'package:w3c_event_source/w3c_event_source.dart';

class HomeProvider with ChangeNotifier{
    Set users = new Set();
    final events = EventSource(Uri.parse('http://192.168.1.15:8080/users'));
// Listening on the `events` stream will open a connection.

 getdata(){
     events.events.listen((MessageEvent message) {
         users.add(json.decode(message.data));
         print('${message.name}: $users');
         notifyListeners();
     });
 }



}