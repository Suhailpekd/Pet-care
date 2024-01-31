import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/doctor/doctorhome.dart';

import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Doctorappointments extends StatefulWidget {
  var appointmentid;
  var bookdate;
  var bookedtime;
  var username;
  var image;
  var petid;
  Doctorappointments(
      {super.key,
      required this.appointmentid,
      required this.bookdate,
      required this.bookedtime,
      required this.username,
      required this.image,
      required this.petid});

  @override
  State<Doctorappointments> createState() => _DoctorappointmentsState();
}

class _DoctorappointmentsState extends State<Doctorappointments> {
  List a = [];

  List heightData = [];
  List weightData = [];
  List bpData = [];
  List hrData = [];
  List monthData = [];
  List monthData1 = [];
  List monthData2 = [];
  List monthData3 = [];

  var petName = "Loading..."; // Initial placeholder value
  var age = "Loading..."; // Initial placeholder value
  bool isLoading = true;
  var image;
  @override
  void initState() {
    super.initState();
    print(widget.petid);
    getData();
    fetchWeight();
    fetchheight();
    fechhr();

    fetchbp();
  }

  Future<void> fetchWeight() async {
    QuerySnapshot weightSnapshot = await FirebaseFirestore.instance
        .collection('weight')
        .where('petid', isEqualTo: widget.petid)
        .get();

    setState(() {
      // Map weight and month data
      weightData = weightSnapshot.docs.map((doc) => doc['weight']).toList();
    });
    print(weightData);
  } // Flag to track whether data is being loaded

  Future<void> fechhr() async {
    QuerySnapshot hrSnapshot = await FirebaseFirestore.instance
        .collection("heartrate")
        .where("petsid", isEqualTo: widget.petid)
        .get();
    setState(() {
      hrData = hrSnapshot.docs.map((doc) => doc["heartrate"]).toList();
    });
    print("$hrData");
  }

  Future<void> fetchheight() async {
    QuerySnapshot heightSnapshot = await FirebaseFirestore.instance
        .collection('height')
        .where('petid', isEqualTo: widget.petid)
        .get();

    setState(() {
      // Map weight and month data
      heightData = heightSnapshot.docs.map((doc) => doc['height']).toList();
      // heightData.reversed;
    });
    print(heightData);
  } // Flag to track whether data is being loaded

  // Future<void> fetch() async {
  //   QuerySnapshot weightSnapshot = await FirebaseFirestore.instance
  //       .collection('weight')
  //       .where('petid', isEqualTo: widget.petid)
  //       .get();

  //   setState(() {
  //     // Map weight and month data
  //     weightData = weightSnapshot.docs.map((doc) => doc['weight']).toList();
  //   });
  //   print(weightData);
  // } // Flag to track whether data is being loaded

  Future<void> fetchbp() async {
    QuerySnapshot bpSnapshot = await FirebaseFirestore.instance
        .collection('bp')
        .where('petid', isEqualTo: widget.petid)
        .get();

    setState(() {
      // Map weight and month data
      bpData = bpSnapshot.docs.map((doc) => doc['bp']).toList();
      // heightData.reversed;
    });
    print(bpData);
  } // Flag to trac

  Future<void> getData() async {
    try {
      DocumentSnapshot petSnapshot = await FirebaseFirestore.instance
          .collection('petlist')
          .doc(widget.petid)
          .get();

      if (petSnapshot.exists) {
        setState(() {
          petName = petSnapshot['name'];
          age = petSnapshot['age'];
          image = petSnapshot['image_url'];
          // Data loading is complete
        });
      } else {
        // Handle case where the pet with the specified ID doesn't exist
        print('Pet not found');
        setState(() {
          petName = 'Not Found';
          age = 'Not Found';
          isLoading = false; // Data loading is complete
        });
      }
    } catch (error) {
      print('Error retrieving pet data: $error');
      setState(() {
        petName = 'Error';
        age = 'Error';
        isLoading = false; // Data loading is complete
      });
    }
  }

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
          ////     end deteils

//weight
          Center(
            child: Text(
              "Weight",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Column(children: [
            Container(
              width: 260,
              height: 150,
              child: SfSparkLineChart(
                //Enable the trackball
                trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                ),
                //Enable marker
                marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all,
                ),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                data: List.generate(weightData.length, (index) {
                  // Ensure index is within valid range
                  return double.parse(weightData[index].toString());
                }),
              ),
            ),
            Center(
              child: Text(
                "height",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Container(
              width: 260,
              height: 150,
              child: Container(
                width: 260,
                height: 150,
                child: SfSparkLineChart(
                  //Enable the trackball
                  trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap,
                  ),
                  //Enable marker
                  marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all,
                  ),
                  //Enable data label
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  data: List.generate(heightData.length, (index) {
                    // Ensure index is within valid range
                    return double.parse(heightData[index].toString());
                  }),
                ),
              ),
            ),
            Center(
              child: Text(
                "BP",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Container(
              width: 260,
              height: 150,
              child: SfSparkLineChart(
                //Enable the trackball
                trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                ),
                //Enable marker
                marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all,
                ),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                data: List.generate(bpData.length, (index) {
                  // Ensure index is within valid range
                  return double.parse(bpData[index].toString());
                }),
              ),
            ),
            Center(
              child: Text(
                "Heart Rate",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Container(
              width: 260,
              height: 150,
              child: SfSparkLineChart(
                //Enable the trackball
                trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                ),
                //Enable marker
                marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all,
                ),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                data: List.generate(hrData.length, (index) {
                  // Ensure index is within valid range
                  return double.parse(hrData[index].toString());
                }),
              ),
            )
          ]),
          SizedBox(
            height: 40,
          )
        ]));
  }
}
