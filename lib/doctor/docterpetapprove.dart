import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/user/conformbooking/conformbook.dart';

class Doctorappointments extends StatefulWidget {
  var appointmentid;
  var bookdate;
  var bookedtime;
  var username;
  Doctorappointments(
      {super.key,
      required this.appointmentid,
      required this.bookdate,
      required this.bookedtime,
      required this.username});

  @override
  State<Doctorappointments> createState() => _DoctorappointmentsState();
}

class _DoctorappointmentsState extends State<Doctorappointments> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQueryData().size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(children: [
        Container(
          height: 235,
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 29,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 163, 202, 234),
                            backgroundImage: AssetImage(
                              "asset/catpic.jpg",
                            ),
                            radius: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 110,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          "BOOKING DETAILS",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("pet owner name :   ${widget.username}"
                            .toUpperCase()),
                        Text("booked date   :   ${widget.bookdate}"
                            .toUpperCase()),
                        Text("booked time   :   ${widget.bookedtime}"
                            .toUpperCase()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 330,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('appoinments')
                    .doc(widget.appointmentid)
                    .update({'status': '2'});
                Fluttertoast.showToast(msg: "appointment rejected");
                Navigator.pop(context);
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Rejected'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('appoinments')
                    .doc(widget.appointmentid)
                    .update({'status': '1'});
                Fluttertoast.showToast(msg: "appointment approved");
                Navigator.pop(context);
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Approved',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
