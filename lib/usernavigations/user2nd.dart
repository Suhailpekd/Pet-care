import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/bookingappointment/bookappointment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer_doctor extends StatefulWidget {
  const Customer_doctor({super.key});

  @override
  State<Customer_doctor> createState() => _Customer_doctorState();
}

class _Customer_doctorState extends State<Customer_doctor> {
  var userId;
  var userogid;
  var star;

  @override
  void initState() {
    super.initState();
    retrieveUserID();
  }

  var id = "";
  double value2 = 0;
  void _updateRating(double rating) {
    // Access Firebase Firestore and add the rating to the collection
    FirebaseFirestore.instance.collection('ratings').add({
      'rating': rating,
      'timestamp': FieldValue.serverTimestamp(),
      "userogId": userId,
      "doctorId": id // Optionally, you can include a timestamp
    }).then((value) {
      setState(() {
        value2 = rating;
      });
      print('Rating added to Firestore: $rating');
    }).catchError((error) {
      print('Error adding rating to Firestore: $error');
    });
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('name') ?? ''.toString();
      userogid = prefs.getString("id") ?? "".toString();
      // Retrieve the user ID
    });
  }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("doctorlist").get();
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  // Future<void> fetchData2() async {
  //   await FirebaseFirestore.instance
  //       .collection('doctorlist')
  //       .doc()
  //       .update({"review": value2});
  // }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [logout1()],
      ),
      body: SafeArea(
        child:
            // Column(children: [
            //   Container(
            //       height: 130,
            //       color: Color.fromARGB(255, 164, 125, 111),
            //       child: Center(child: Text("Doctor"))),
            FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('doctorlist')
              .where("status", isEqualTo: "1")
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
              return Column(children: [
                Container(
                    height: 100,
                    width: screenSize.width,
                    color: Colors.brown,
                    child: Center(
                      child: Text(
                        "DOCTORS",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    )),
                Center(child: Text('No Doctors Available'))
              ]);
            }

            // Extract the documents from the snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return Column(
              children: [
                Container(
                    height: 100,
                    width: screenSize.width,
                    color: Colors.brown,
                    child: Center(
                      child: Text(
                        "DOCTORS",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    )),
                Expanded(
                  child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Access data from each document in the collection
                        Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;
                        id = documents[index].id;

                        // Create a Container using the data
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: InkWell(
                            onTap: () async {
                              if (data["available"] == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: "This Doctor Is Not Available");
                              } else {
                                // await FirebaseFirestore.instance
                                //     .collection('review')
                                //     .add({
                                //   "userid": userogid,
                                //   "review": value2
                                // });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Appointment_inner_page(
                                              name: data["name"].toString(),
                                              about: data["about"].toString(),
                                              fees: data["fees"].toString(),
                                              time: data["time"].toString(),
                                              id: id),
                                    ));
                              }
                            },
                            child: Container(
                              height: 120,
                              width: screenSize.width,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(208, 246, 222, 213),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                          child: Image.asset(
                                        "asset/Avatar-Profile-Vector-PNG-File.png",
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Name:${data["name"].toString()}kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Location:${data["location"].toString()}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                data["available"].toString(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromARGB(
                                                        255, 4, 7, 1)),
                                              ),
                                            ),
                                            Expanded(
                                              child: RatingBar(
                                                filledIcon: Icons.star,
                                                size: 20,
                                                emptyIcon: Icons.star_border,
                                                onRatingChanged: (value) =>
                                                    _updateRating(value),
                                                initialRating: 0,
                                                maxRating: 5,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
