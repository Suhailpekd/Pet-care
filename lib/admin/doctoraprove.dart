import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/customeraprove.dart';
import 'package:petcare/admin/doctorlist.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/navigation/navigation.dart';

class Doctoraprove extends StatefulWidget {
  var name;
  var qualification;
  var email;
  var fees;
  var documents;
  Doctoraprove(
      {super.key,
      required this.name,
      required this.email,
      required this.qualification,
      required this.fees,
      required List<DocumentSnapshot<Object?>> documents});

  @override
  State<Doctoraprove> createState() => _DoctoraproveState();
}

class _DoctoraproveState extends State<Doctoraprove> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 55, left: 30),
        child: InkWell(
          onTap: () {
            Navigator.pop(
              context,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.arrow_back,
                size: 29,
              ),
              Text(
                "Doctors Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.delete,
                  size: 29,
                ),
              ),
            ],
          ),
        ),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      " ${widget.name}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 34, right: 34, top: 34),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: screenSize.width / 2.3,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(222, 225, 166, 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text(
                              " ${widget.qualification}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Container(
                            width: screenSize.width / 2.3,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(222, 225, 166, 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text(
                              " ${widget.fees}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 260,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 34, right: 34, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              return
                                  //  await FirebaseFirestore.instance
                                  //               .collection('doctorlist')
                                  //               .doc(widget.documents[index].id)
                                  //               .delete();
                                  setState(() async {
                                await widget.documents.removeAt(Index);
                              });
                            },
                            child: Container(
                              width: screenSize.width / 2.3,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(222, 224, 10, 10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "Reject",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Container(
                            width: screenSize.width / 2.3,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(222, 1, 154, 100),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text(
                              "Approve",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
        ),
      ),
    ]));
  }
}
