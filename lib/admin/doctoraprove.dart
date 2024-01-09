import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/customeraprove.dart';
import 'package:petcare/admin/doctorlist.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/navigation/navigation.dart';

class Doctoraprove extends StatefulWidget {
  var name;
  var qualification;
  var email;
  var fees;
  var documents;
  String id;

  Doctoraprove({
    super.key,
    required this.name,
    required this.email,
    required this.qualification,
    required this.fees,
    required List<DocumentSnapshot<Object?>> documents,
    required this.id,
  });

  @override
  State<Doctoraprove> createState() => _DoctoraproveState();
}

class _DoctoraproveState extends State<Doctoraprove> {
  @override
  Widget build(BuildContext context) {
    // var a = widget.documents;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Doctors List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('doctorlist')
                    .doc(widget.id)
                    .delete();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return Tabbar1();
                  },
                ));
              },
              child: Icon(
                Icons.delete,
                size: 29,
              ),
            ),
          ],
        )),
        body: ListView(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 54),
              child: Column(
                children: [
                  Column(
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              " ${widget.name}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              " ${widget.email}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 34, right: 34, top: 34),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Qualification"),
                                    Container(
                                      width: screenSize.width / 3,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(222, 171, 126, 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                          child: Expanded(
                                        child: Text(
                                          " ${widget.qualification}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Fees"),
                                    Container(
                                      width: screenSize.width / 3,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(222, 171, 126, 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                          child: Text(
                                        " ${widget.fees}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 206,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 34, right: 34, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection('doctorlist')
                                        .doc(widget.id)
                                        .update({'status': '2'});
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return Tabbar1();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    width: screenSize.width / 3,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(222, 224, 10, 10),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        child: Text(
                                      "Reject",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection('doctorlist')
                                        .doc(widget.id)
                                        .update({'status': '1'});
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return Tabbar1();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    width: screenSize.width / 3,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(222, 1, 154, 100),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        child: Text(
                                      "Approve",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
