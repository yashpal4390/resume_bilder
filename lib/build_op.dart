// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';


import 'util.dart';

class Buildop extends StatefulWidget {
  const Buildop({super.key, required this.title});

  final String title;

  @override
  State<Buildop> createState() => _BuildOptionState();
}

class _BuildOptionState extends State<Buildop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text("Build Option", style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: menuList.map((e) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, e["route_name"]);
                      // Navigator.pushReplacementNamed(context, e["route_name"]);
                      print(e["name"]);
                    },
                    title: Text("${e["name"]}"),
                    leading: Icon(e["icon"]),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
