import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/user/bookingappointment/appoinmentouter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Customer_booking extends StatefulWidget {
  const Customer_booking({super.key});

  @override
  State<Customer_booking> createState() => _Customer_bookingState();
}

class _Customer_bookingState extends State<Customer_booking> {
  @override
  var id;

  @override
  void initState() {
    super.initState();
    retrieveUserID();
    fair();
    print(id);
  }

  var name = "";
  var drname = "";
  var idappointment = "";
  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("appoinments").get();
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('id') ?? '';
      drname = prefs.getString('name') ?? '';
      print(drname);
    });
  }

  Future<void> fair() async {
    await FirebaseFirestore.instance
        .collection("userlist"[id])
        .get()
        .then((snapshot) {
      List<QueryDocumentSnapshot> docList = snapshot.docs;
      setState(() {
        name = docList[0]["name"];
      });
      print("rrrrrrrrrrrrrrrrrrr$name");
    });
  }

  // void()

  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    final Size screenSize = MediaQuery.of(context).size;
    // return var screensize = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('appoinments').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No data available');
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
                      String apointid = data['id'];
                      // Customize the ListTile based on your data structure
                      return Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Cancelbooking(
                                    id: data,
                                    drname: data["name"],
                                    drabout: data["about"],
                                    drtime: data["time"],
                                    drfees: data["fees"],
                                    appointmentid: apointid,
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
                                          "Dr Name:${data["name"]}  ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Date ${data["date"]}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Time ${data["time"]}",
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
                                // Expanded(
                                //   child: RatingBar(
                                //     filledIcon: Icons.star, size: 10,
                                //     // size: screenSize.width / 20,
                                //     emptyIcon: Icons.star_border,
                                //     onRatingChanged: (value) => debugPrint('$value'),
                                //     initialRating: 3,
                                //     maxRating: 5,
                                //   ),
                                // )
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
