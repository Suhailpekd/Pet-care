import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/user/conformbooking/conformbook.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Doctorappointments extends StatefulWidget {
  var appointmentid;
  var bookdate;
  var bookedtime;
  var username;
  var image;
  Doctorappointments(
      {super.key,
      required this.appointmentid,
      required this.bookdate,
      required this.bookedtime,
      required this.username,
      required this.image});

  @override
  State<Doctorappointments> createState() => _DoctorappointmentsState();
}

class _DoctorappointmentsState extends State<Doctorappointments> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQueryData().size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey.shade100,
      body: ListView(children: [
        Container(
          height: 235,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 163, 202, 234),
                  backgroundImage: NetworkImage(
                    widget.image,
                  ),
                  radius: 70,
                ),
              ],
            ),
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
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
              width: screenSize.width,
              height: screenSize.height / 2,
              child: SfSparkLineChart(
                //Enable the trackball
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                data: <double>[100, 200, 300],
              )),
        ),
      ]),
    );
  }
}
