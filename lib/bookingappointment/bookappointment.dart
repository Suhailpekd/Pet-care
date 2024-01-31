import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/navigation/navigation.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Appointment_inner_page extends StatefulWidget {
  String name;
  String about;
  String fees;
  String time;
  String id;
  Appointment_inner_page(
      {super.key,
      required this.name,
      required this.about,
      required this.fees,
      required this.time,
      required this.id});

  @override
  State<Appointment_inner_page> createState() => _Appointment_inner_pageState();
}

class _Appointment_inner_pageState extends State<Appointment_inner_page> {
// List to store Firebase collection data
  @override
  void initState() {
    super.initState();
    // Call your function to retrieve user ID here
    retrieveUserID();
    fetchData();
  }

  @override
  var userId = "";
  var userogid = "";
  List a = [];
  int limitcount = 0;
  int count = 0;
  String selectedData = 'Select Data'; // Default value for dropdown
  List firebaseData = [];
  String selectedValue = 'Option 1';

  // Future<void> fetchDataFromFirebase() async {
  //   // Replace 'your_collection_name' with the actual name of your Firebase collection
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('petlist').get();

  //   List data = querySnapshot.docs
  //       .map((DocumentSnapshot document) => document['your_field_name'])
  //       .toList();

  //   setState(() {
  //     firebaseData = data;
  //   });
  // }

  // Future<void> updateFirebaseData(String selectedValue) async {
  //   // Perform the necessary update to another Firebase collection
  //   // Replace 'your_other_collection_name' and 'your_field_name' accordingly
  //   await FirebaseFirestore.instance
  //       .collection('your_other_collection_name')
  //       .doc('document_id') // Replace 'document_id' with the actual document ID
  //       .update({'your_field_name': selectedValue});
  // }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('name') ?? ''.toString();
      userogid = prefs.getString("id") ?? "".toString();
      // Retrieve the user ID
    });
  }

  var Image = "";
  var petId = "";
  var imagestatus = "";
  var customerId = "";
  var name = "";
  DateTime now = DateTime.now();

  Future<void> updatebooking() async {
    // Get a reference to the Firestore collection
    await FirebaseFirestore.instance.collection('appoinments').add({
      'time': '${now.hour}:${(now.minute)}:${(now.second)}'.toString(),
      "date": '${now.year}-${(now.month)}-${(now.day)}'.toString(),
      "name": widget.name,
      "about": widget.about,
      "fees": widget.fees,
      "doctorid": widget.id,
      "sheduledtime": widget.time,
      'userid': userogid,
      "status": "0",
      "username": userId,
      "token": count,
      "image": Image ?? "noimage",
      "graphdata": "",
      "graph2data": "",
      "option1": petId,
      "option2": "",
      "height": "",
      "weight": "",
      "bp": "",
      "heartrate": ""
    });
    await fair2updatedoctor();

    // Fluttertoast.showToast(msg: 'Booking Successful ${widget.name}');
  }

  bool isChecked = false;
  Future<void> fair2updatedoctor() async {
    await FirebaseFirestore.instance
        .collection("doctorlist")
        .doc(widget.id)
        .update({"option1": userogid});
  }

  Future<DocumentSnapshot> fetchData() async {
    try {
      DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("doctorlist")
          .doc(widget.id)
          .get();

      setState(() {
        count = querySnapshot["token"];
        limitcount = querySnapshot["option2"];
      });

      print("hhhhhhhhhhhhh$limitcount");
      return querySnapshot;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return Future.value(null);
    }
  }

  Future<void> updateDocument() async {
    // fetchData();

    if (count >= limitcount) {
      Fluttertoast.showToast(msg: "Error Booking, Slots Full");
      Navigator.pop(context);
    } else {
      setState(() {
        count++;
      });

      await FirebaseFirestore.instance
          .collection('doctorlist')
          .doc(widget.id)
          .update({
        'token': count,
        "bookedtime": '${now.hour}:${(now.minute)}:${(now.second)}'.toString(),
      });

      await updatebooking();

      await showDialog(
        barrierLabel: "your token",
        context: context,
        builder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(color: Colors.white, boxShadow: []),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Text(
                              "Booking Succesfull",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 3, 159, 173)),
                            ),
                            Text(
                              "Your Token Number $count",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 3, 159, 173)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      Fluttertoast.showToast(msg: 'Booking Successful ${widget.name}');
    }
  }
  // }
  // Get a reference to the Firestore collection

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQueryData().size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  radius: 70,
                ),
                Text("${widget.name}")
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
                          Text("${widget.about}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('petlist')
                  .where("userid", isEqualTo: userogid)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                var petname = documents[0]["name"];

                petId = documents[0].id;
                Image = documents[0]["image_url"];
                print("$Image");

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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Selecte pet: $selectedValue'),
                      SizedBox(height: 20),
                      DropdownButton<String>(
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: <String>[]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }),
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
                              Text("${widget.fees}"),
                            ],
                          ),
                        )))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 75, right: 75, bottom: 10),
            child: InkWell(
              onTap: () async {
                await updateDocument();
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
                    color: Color.fromARGB(255, 164, 125, 111),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  "Book Now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
