import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctorproedit extends StatefulWidget {
  const Doctorproedit({super.key});

  @override
  State<Doctorproedit> createState() => _DoctorproeditState();
}

class _DoctorproeditState extends State<Doctorproedit> {
  @override
  var name = "";
  var email = "";
  var location = "";
  var about = "";
  var id = "";
  var available = "";

  var nametext = TextEditingController();
  var emailtext = TextEditingController();
  var locationtext = TextEditingController();
  var abouttext = TextEditingController();
  void initState() {
    super.initState();
    share();
  }

  var selectedOption;
  Future<dynamic> share() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      location = prefs.getString('location') ?? '';
      id = prefs.getString('id') ?? '';
      available = prefs.getString("available") ?? "";

      setState(() {
        nametext = TextEditingController(text: name);
        emailtext = TextEditingController(text: email);
        locationtext = TextEditingController(text: location);
        setState(() {
          selectedOption = available;
        });
      });

      print(email);
      print(location);
      print(name); // Retrieve the user ID
    });
    return selectedOption;
  }

  Future<void> updateDocument() async {
    // Get a reference to the Firestore collection
    await FirebaseFirestore.instance.collection('doctorlist').doc(id).update({
      'name': nametext.text,
      'email': emailtext.text,
      "location": locationtext.text,
      "about": abouttext.text,
      "available": selectedOption
    });

    print('Document successfully updated!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 54),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: "available",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      Text('Available'),
                      Radio(
                        value: "Not Available",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      Text('Not Available'),
                    ],
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
                            controller: nametext,
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
                            controller: emailtext,
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
                            controller: locationtext,
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
                          "About",
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
                        height: 104,
                        width: double.infinity,
                        child: Center(
                          child: TextFormField(
                            controller: abouttext,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                ),
                                hintText: "write somthing about you"),
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
                          Navigator.pop(context);
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
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
