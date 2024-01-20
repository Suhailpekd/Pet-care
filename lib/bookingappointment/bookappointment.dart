import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:petcare/user/conformbooking/conformbook.dart';
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
  @override
  var userId = "";
  var userogid = "";
  List a = [];
  int limitcount = 0;
  int count = 0;

  @override
  void initState() {
    super.initState();
    // Call your function to retrieve user ID here
    retrieveUserID();
    fetchData();
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('name') ?? ''.toString();
      userogid = prefs.getString("id") ?? "".toString();
      // Retrieve the user ID
    });
  }

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
    });
    await fair2updatedoctor();

    // Fluttertoast.showToast(msg: 'Booking Successful ${widget.name}');
  }

  Future<void> fair2updatedoctor() async {
    await FirebaseFirestore.instance
        .collection("doctorlist")
        .doc(widget.id)
        .update({"option1": userogid});
  }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("doctorlist").get();
      count = querySnapshot.docs[0]["token"];
      setState(() {
        limitcount = querySnapshot.docs[0]["option2"];
      });

      print("hhhhhhhhhhhhh$limitcount");
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  Future<void> updateDocument() async {
    // fetchData();

    if (count <= limitcount) {
      Fluttertoast.showToast(msg: "Error Booking, Slots Full");
      Navigator.pop(context);
    } else {
      count++;
      await FirebaseFirestore.instance
          .collection('doctorlist')
          .doc(widget.id)
          .update({
        "option"
            'token': count,
        "bookedtime": '${now.hour}:${(now.minute)}:${(now.second)}'.toString(),
      });
      await updatebooking();
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

                showDialog(
                  barrierLabel: "your token",
                  context: context,
                  builder: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                        height: 200,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: []),
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
                                            color: Color.fromARGB(
                                                255, 3, 159, 173)),
                                      ),
                                      Text(
                                        "Your Token Number $count",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 3, 159, 173)),
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
