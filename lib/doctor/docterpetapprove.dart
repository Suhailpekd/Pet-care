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
        Center(
          child: Text(
            "Height",
            style: TextStyle(fontSize: 26),
          ),
        ),
        FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('height')
                .where("petid", isEqualTo: widget.petid)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No data available'));
              }

              // Extract the documents from the snapshot
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              List<dynamic> graphData = documents.last["height"];

              List a = graphData;

              // Convert the graphData to a list of double
              List graph = graphData.map((value) => value.toDouble()).toList();
              print(a);

              if (documents.isNotEmpty) {
                // String department = documents[0]["age"];
                // String email = customerSnapshot.docs[0]["email"];
                // String fees = customerSnapshot.docs[0]["fees"];
                // String qualification = customerSnapshot.docs[0]
                //     ["qualification"]; // Retrieve the ID from the first document
              }
              // spref.setString('agepet', age);
              // spref.setString('department', department);
              // spref.setString('fees', fees); // Save the user ID to SharedPreferences
              // spref.setString('qualification', qualification);

              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                        width: 260,
                        height: 150,
                        child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[10, 2, 3, 4, 5, 8, 9])),
                  ],
                ),
              );
            }),

//weight
        Center(
          child: Text(
            "Weight",
            style: TextStyle(fontSize: 26),
          ),
        ),
        FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('weight')
                .where("petid", isEqualTo: widget.petid)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No data available'));
              }

              // Extract the documents from the snapshot
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              List<dynamic> graphData = documents.last["weight"];

              List a = graphData;

              // Convert the graphData to a list of double
              List graph = graphData.map((value) => value.toDouble()).toList();
              print(a);

              if (documents.isNotEmpty) {
                // String department = documents[0]["age"];
                // String email = customerSnapshot.docs[0]["email"];
                // String fees = customerSnapshot.docs[0]["fees"];
                // String qualification = customerSnapshot.docs[0]
                //     ["qualification"]; // Retrieve the ID from the first document
              }
              // spref.setString('agepet', age);
              // spref.setString('department', department);
              // spref.setString('fees', fees); // Save the user ID to SharedPreferences
              // spref.setString('qualification', qualification);

              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                        width: 260,
                        height: 150,
                        child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[10, 2, 3, 4, 5, 8, 9])),
                  ],
                ),
              );
            }),
        Center(
          child: Text(
            "Bp",
            style: TextStyle(fontSize: 26),
          ),
        ),
        FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('bp')
                .where("petid", isEqualTo: widget.petid)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No data available'));
              }

              // Extract the documents from the snapshot
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              List<dynamic> graphData = documents.last["height"];

              List a = graphData;

              // Convert the graphData to a list of double
              List graph = graphData.map((value) => value.toDouble()).toList();
              print(a);

              if (documents.isNotEmpty) {
                // String department = documents[0]["age"];
                // String email = customerSnapshot.docs[0]["email"];
                // String fees = customerSnapshot.docs[0]["fees"];
                // String qualification = customerSnapshot.docs[0]
                //     ["qualification"]; // Retrieve the ID from the first document
              }
              // spref.setString('agepet', age);
              // spref.setString('department', department);
              // spref.setString('fees', fees); // Save the user ID to SharedPreferences
              // spref.setString('qualification', qualification);

              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                        width: 260,
                        height: 150,
                        child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[10, 2, 3, 4, 5, 8, 9])),
                  ],
                ),
              );
            }),

        Center(
          child: Text(
            "Heart rate",
            style: TextStyle(fontSize: 26),
          ),
        ),
        FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('bp')
                .where("petid", isEqualTo: widget.petid)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No data available'));
              }

              // Extract the documents from the snapshot
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              List<dynamic> graphData = documents.last["height"];

              List a = graphData;

              // Convert the graphData to a list of double
              List graph = graphData.map((value) => value.toDouble()).toList();
              print(a);

              if (documents.isNotEmpty) {
                // String department = documents[0]["age"];
                // String email = customerSnapshot.docs[0]["email"];
                // String fees = customerSnapshot.docs[0]["fees"];
                // String qualification = customerSnapshot.docs[0]
                //     ["qualification"]; // Retrieve the ID from the first document
              }
              // spref.setString('agepet', age);
              // spref.setString('department', department);
              // spref.setString('fees', fees); // Save the user ID to SharedPreferences
              // spref.setString('qualification', qualification);

              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                        width: 260,
                        height: 150,
                        child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[10, 2, 3, 4, 5, 8, 9])),
                  ],
                ),
              );
            }),
      ]),
    );
  }
}
