import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trano/providers/HomeProvider.dart';
import 'package:w3c_event_source/w3c_event_source.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    homeProvider.getdata();
    Set users = homeProvider.users;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (_,i){
              return Text(users.toList()[i]["name"]);
            }),
    ));
  }
}
