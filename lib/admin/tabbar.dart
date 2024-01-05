import 'package:flutter/material.dart';
import 'package:petcare/admin/costomerlist.dart';
import 'package:petcare/admin/doctorlist.dart';

class Tabbar1 extends StatefulWidget {
  const Tabbar1({super.key});

  @override
  State<Tabbar1> createState() => _Tabbar1State();
}

class _Tabbar1State extends State<Tabbar1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Doctor'),
              Tab(text: 'Customer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Content for Tab 1
            Center(child: Doctorlist()),
            // Content for Tab 2
            Center(child: Customerlist()),
          ],
        ),
      ),
    );
  }
}
