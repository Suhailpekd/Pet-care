import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/bookingappointment/appoincancel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Customer_booking extends StatefulWidget {
  const Customer_booking({super.key});

  @override
  State<Customer_booking> createState() => _Customer_bookingState();
}

class _Customer_bookingState extends State<Customer_booking> {
  // var id;
  var id = "";
  var name = "";
  var drname = "";
  var idappointment = "";
  var appointment = "";
  @override
  void initState() {
    super.initState();
    retrieveUserID();
    fetchData();
    // fair();
    // print(id);
  }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("appoinments")
          .where("userid", isEqualTo: id)
          .get();
      appointment = querySnapshot.docs[0]["doctorid"];
      print('"""""""""""""object"""""""""""""');
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  void dlt() {}

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('id') ?? '';
      drname = prefs.getString('name') ?? '';

      print(drname);
    });
  }

  @override
  Widget build(BuildContext context) {
    double value = 0;
    final Size screenSize = MediaQuery.of(context).size;
    // return var screensize = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('appoinments')
          .where("userid", isEqualTo: id)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return SafeArea(
              child: Column(children: [
            logout1(),
            Container(
                width: screenSize.width,
                height: 150,
                color: Color.fromARGB(255, 164, 125, 111),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 163, 202, 234),
                            backgroundImage: AssetImage(
                              "asset/Avatar-Profile-Vector-PNG-File.png",
                            ),
                            radius: 40,
                          ),
                        ),
                        Text(
                          drname,
                          style: TextStyle(color: Colors.white),
                        )
                      ]))
                ])),
            Text('No data available')
          ]));
        } else {
          return SafeArea(
            child: Column(
              children: [
                logout1(),
                Container(
                    width: screenSize.width,
                    height: 150,
                    color: Color.fromARGB(255, 164, 125, 111),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 32),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                        255, 163, 202, 234),
                                    backgroundImage: AssetImage(
                                      "asset/Avatar-Profile-Vector-PNG-File.png",
                                    ),
                                    radius: 40,
                                  ),
                                ),
                                Text(
                                  drname,
                                  style: TextStyle(color: Colors.white),
                                )
                              ]))
                        ])),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // Access the data for each document
                      Map<String, dynamic> data = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      print(data);

                      // String apointid = data['id'];
                      // Customize the ListTile based on your data structure
                      return Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Cancelbooking(
                                      id: data["doctorid"],
                                      drname: data["name"],
                                      drabout: data["about"],
                                      drtime: data["time"],
                                      drfees: data["fees"],
                                      a_id: snapshot.data!.docs[index].id

                                      // appointmentid: apointid,
                                      ),
                                  // idappointments: data["id"]),
                                ));
                          },
                          child: Container(
                            height: 120,
                            width: screenSize.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 164, 125, 111),
                                ),
                                color: Color.fromARGB(208, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: //screenSize.width * 0.3,
                                        80,
                                    height: 100,
                                    color: Colors.white,
                                    child: Center(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "asset/Avatar-Profile-Vector-PNG-File.png",
                                              fit: BoxFit.cover,
                                            ))),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Dr Name:${data["name"]}  "
                                              .toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Date ${data["date"]}".toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Time ${data["time"]}".toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
          //   ],
          // );
        }
      },
    );
  }
}
