import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/navigation/navigation.dart';

class Customeraprove extends StatefulWidget {
  var doc;
  var doc2;
  var doc1;
  var id1;
  Customeraprove(
      {super.key,
      required this.doc,
      required this.doc1,
      required this.doc2,
      required this.id1}); //name//email//mobail

  @override
  State<Customeraprove> createState() => _CustomeraproveState();
}

class _CustomeraproveState extends State<Customeraprove> {
  Future<void> addUserData() async {
    try {
      // Replace 'users' with your collection name
      CollectionReference users =
          FirebaseFirestore.instance.collection('userlist');

      // Replace these with your actual data to be added
      await users.add({
        'status': '1',
      });

      print('User added to Firestore successfully!');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 55, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 29,
              ),
            ),
            Text(
              "Customer Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.delete,
              size: 29,
            ),
          ],
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 54),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    "${widget.doc}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    "${widget.doc1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    "${widget.doc2}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
                height: 400,
                color: Colors.grey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 34, right: 34, bottom: 30, top: 280),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              addUserData();
                            },
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ]),
        ),
      ),
    ]));
  }
}
