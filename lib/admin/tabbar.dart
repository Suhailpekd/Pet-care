import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/admin/costomerlist.dart';
import 'package:petcare/admin/doctorlist.dart';
import 'package:petcare/firstpages/login.dart';
import 'package:petcare/logoutbuttun.dart';

class Tabbar1 extends StatefulWidget {
  const Tabbar1({super.key});

  @override
  State<Tabbar1> createState() => _Tabbar1State();
}

class _Tabbar1State extends State<Tabbar1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                    return Firstlogin();
                  }));
                },
                icon: Icon(Icons.logout_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 177, 109, 19)),
                child: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      "Doctors",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                    Tab(
                      child: Text(
                        "Costomers",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // Creates border
                      color: Color.fromARGB(255, 120, 49, 2)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Color.fromARGB(255, 255, 253, 251),
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Expanded(
                child: TabBarView(children: [
              Center(child: Doctorlist()),
              Center(child: Customerlist())
            ]))
          ]),
        ),
      ),
    );
  }
}
