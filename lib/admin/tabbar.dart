import 'package:flutter/material.dart';
import 'package:petcare/admin/costomerlist.dart';
import 'package:petcare/admin/doctorlist.dart';

class Tabbar1 extends StatefulWidget {
  const Tabbar1({super.key});

  @override
  State<Tabbar1> createState() => _Tabbar1State();
}

class _Tabbar1State extends State<Tabbar1> {
  Color doctorTabColor = Colors.blue; // Color for the Doctor tab
  Color customerTabColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor:
                Colors.transparent, // Set indicator color to transparent
            onTap: (index) {
              setState(() {
                // Update colors based on the selected tab index
                if (index == 0) {
                  doctorTabColor = Colors.blue;
                  customerTabColor = Colors.grey; // Set the inactive tab color
                } else {
                  doctorTabColor = Colors.grey; // Set the inactive tab color
                  customerTabColor = Colors.green;
                }
              });
            },
            tabs: [
              Container(
                color: doctorTabColor,
                child: Tab(text: 'Doctor'),
              ),
              Container(
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
