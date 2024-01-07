import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_profile_edit extends StatefulWidget {
  const User_profile_edit({super.key});

  @override
  State<User_profile_edit> createState() => _User_profile_editState();
}

class _User_profile_editState extends State<User_profile_edit> {
  var name = "";
  var email = "";
  var location = "";
  var contact = "";
  var id = "";

  @override
  void initState() {
    super.initState();
    // Call your function to retrieve user ID here
    retrieveUserID();

    name1 = TextEditingController(text: name);
    email2 = TextEditingController(text: email);
    location3 = TextEditingController(text: location);
    contact4 = TextEditingController(text: contact);
  }

  Future<void> updateDocument() async {
    // Get a reference to the Firestore collection
    await FirebaseFirestore.instance.collection('userlist').doc(id).update({
      'name': name1.text,
      'email': email2.text,
      "location": location3.text,
      "contact": contact4.text,
    });

    print('Document successfully updated!');
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var name = prefs.getString('name') ?? '';
      var email = prefs.getString('email') ?? '';
      var location = prefs.getString('location') ?? '';
      var contact = prefs.getString('contact') ?? '';
      id = prefs.getString('id') ?? '';
      print(id);
      print(contact);
      print(email);
      print(location);
      print(name); // Retrieve the user ID
    });
  }

  var name1 = TextEditingController();
  var email2 = TextEditingController();
  var location3 = TextEditingController();
  var contact4 = TextEditingController();

  // void initstate() {
  //   user1 = TextEditingController(text: widget.docs66);
  //   user2 = TextEditingController(text: widget.name1);
  //   user3 = TextEditingController(text: widget.mob);
  //   user4 = TextEditingController(text: widget.password);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navigation(),
                          ));
                    }
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
                  padding: const EdgeInsets.only(top: 54),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 163, 202, 234),
                        backgroundImage: AssetImage(
                          "asset/Avatar-Profile-Vector-PNG-File.png",
                        ),
                        radius: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 34, bottom: 5),
                            child: Text(
                              "name",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            child: Center(
                              child: TextFormField(
                                controller: name1,
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                    ),
                                    hintText: "Enter your name"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.4,
                                    color: Color.fromARGB(255, 200, 139, 6)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 34, bottom: 5, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "email",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            child: Center(
                              child: TextFormField(
                                controller: email2,
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                    ),
                                    hintText: "Enter your email"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.4,
                                    color: Color.fromARGB(255, 200, 139, 6)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 34, bottom: 5, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            child: Center(
                              child: TextFormField(
                                controller: location3,
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                    ),
                                    hintText: "Enter your location"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.4,
                                    color: Color.fromARGB(255, 200, 139, 6)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 34, bottom: 5, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Contact",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            child: Center(
                              child: TextFormField(
                                controller: contact4,
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                    ),
                                    hintText: "Enter contact number"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.4,
                                    color: Color.fromARGB(255, 200, 139, 6)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 34, left: 77.0, right: 77.0, bottom: 20),
                          child: InkWell(
                            onTap: () async {
                              await updateDocument();

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Navigation(),
                                  ));
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
                                  color: Color.fromARGB(222, 2, 161, 130),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ]));
  }
}
