import 'package:flutter/material.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/navigation/navigation.dart';

class Doctorproedit extends StatefulWidget {
  const Doctorproedit({super.key});

  @override
  State<Doctorproedit> createState() => _DoctorproeditState();
}

class _DoctorproeditState extends State<Doctorproedit> {
  var selectedOption;
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
                      Navigator.pop(
                        context,
                      );
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            value: 'Option 1',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          Text('Available'),
                          Radio(
                            value: 'Option 2',
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Doctorhome(),
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
