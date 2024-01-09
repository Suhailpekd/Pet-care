import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/user/bookingappointment/appointment_inner_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer_doctor extends StatefulWidget {
  const Customer_doctor({super.key});

  @override
  State<Customer_doctor> createState() => _Customer_doctorState();
}

class _Customer_doctorState extends State<Customer_doctor> {
  var userId;
  var userogid;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:
            //Column(children: [
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
              return Center(child: Text('No Doctors Available'));
            }

            // Extract the documents from the snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            var id = documents[0].id.toString();

            return Column(
              children: [
                logout1(),
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
                        // Create a Container using the data
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: InkWell(
                            onTap: () {
                              if (data["available"] == "Not Available") {
                                Fluttertoast.showToast(
                                    msg: "This Doctor Is Not Available");
                              } else {
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
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(208, 246, 222, 213),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: screenSize.width * 0.3,
                                      height: 120,
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
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 27),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data["name"].toString(),
                                            style: TextStyle(fontSize: 23),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            data["location"].toString(),
                                            style: TextStyle(fontSize: 23),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            data["available"].toString(),
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 4, 7, 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
