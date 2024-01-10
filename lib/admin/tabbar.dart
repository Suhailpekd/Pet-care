import 'package:flutter/material.dart';
import 'package:petcare/admin/costomerlist.dart';
import 'package:petcare/admin/doctorlist.dart';
import 'package:petcare/logoutbuttun.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        body: Column(
          children: [
            Tabbar1(),
          ],
        ),
      ),
    );
  }
}

class Tabbar1 extends StatefulWidget {
  const Tabbar1({Key? key}) : super(key: key);

  @override
  State<Tabbar1> createState() => _Tabbar1State();
}

class _Tabbar1State extends State<Tabbar1> {
  Color doctorTabColor = Colors.blue; // Color for the Doctor tab
  Color customerTabColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: const Color.fromARGB(0, 241, 235, 235),
            onTap: (index) {
              setState(() {
                if (index == 0) {
                  doctorTabColor = Colors.blue;
                  customerTabColor = Colors.grey;
                } else {
                  doctorTabColor = Colors.grey;
                  customerTabColor = Colors.blue;
                }
              });
            },
            tabs: [
              Container(
                width: screenSize.width,
                color: doctorTabColor,
                child: Tab(text: 'Doctor'),
              ),
              Container(
                width: screenSize.width,
                color: customerTabColor,
                child: Tab(text: 'Customer'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Doctorlist()),
            Center(child: Customerlist()),
          ],
        ),
      ),
    );
  }
}
