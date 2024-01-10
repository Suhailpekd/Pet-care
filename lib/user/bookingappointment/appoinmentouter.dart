import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/user/conformbooking/conformbook.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cancelbooking extends StatefulWidget {
  var id;
  var drabout;
  var drname;
  var drfees;
  var drtime;
  // var appointmentid;
  Cancelbooking({
    super.key,
    required this.drabout,
    required this.id,
    required this.drname,
    required this.drtime,
    required this.drfees,
    // required this.appointmentid
  });

  @override
  State<Cancelbooking> createState() => _CancelbookingState();
}

class _CancelbookingState extends State<Cancelbooking> {
  String ids = "";
  var names = "ddd";
  List docList = [];

  @override
  void initState() {
    super.initState();
    retrieveUserID();
    // firedata();
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ids = prefs.getString('id') ?? '';
      print(ids);
      // Retrieve the user ID
    });
  }

  Future<void> delt() async {
    await FirebaseFirestore.instance
        .collection('appoinments')
        .doc(ids)
        .delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var names = docList;
    final screenSize = MediaQueryData().size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Container(
            height: 235,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 163, 202, 234),
                  backgroundImage: AssetImage(
                    "asset/Avatar-Profile-Vector-PNG-File.png",
                  ),
                  radius: 50,
                ),
                Text(
                  "${widget.drname}",
                  style: TextStyle(fontSize: 23),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 150,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text("About me",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          // Text("${widget.appointmentid}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
                height: 110,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        height: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text("Fees",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              Text("${widget.drfees}"),
                            ],
                          ),
                        )))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 75, right: 75, bottom: 10),
            child: InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection('appoinments')
                      .where("doctorid")
                      .get();

                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 234, 227, 236),
                          blurRadius: 8,
                          spreadRadius: 5,
                        )
                      ],
                      color: Color.fromARGB(255, 221, 8, 4),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    "Cancel Booking",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
