import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customeraprove extends StatefulWidget {
  var doc;
  var doc2;
  var doc1;

  String idcustomer;

  Customeraprove({
    super.key,
    required this.doc,
    required this.doc1,
    required this.doc2,
    required this.idcustomer,
  }); //name//email//mobail

  @override
  State<Customeraprove> createState() => _CustomeraproveState();
}

class _CustomeraproveState extends State<Customeraprove> {
  @override
  void initState() {
    super.initState();
    share();
  }

  var id = "";
  Future<void> share() async {
    var share = await SharedPreferences.getInstance();
    setState(() {
      id = share.getString("iduser").toString();
      // var email = share.getString("email");
      // var location = share.getString("");
      print(id);
    });
  }

  // Future<void> updateDocument() async {
  //   // Get a reference to the Firestore collection
  //   await FirebaseFirestore.instance
  //       .collection('doctorlist')
  //       .doc(id)
  //       .update({'status': "1"});

  //   print('Document successfully updated!');
  // }

  // Future<void> updateDocumentreject() async {
  //   // Get a reference to the Firestore collection
  //   await FirebaseFirestore.instance
  //       .collection('doctorlist')
  //       .doc(id)
  //       .update({'status': "0"});

  //   print('Document successfully rejected!');
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Customer List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('doctorlist')
                    .doc(widget.idcustomer)
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
                            "${widget.doc}",
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
                            "${widget.doc1}",
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
                            "${widget.doc2}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
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
                                  child: InkWell(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('userlist')
                                          .doc(widget.idcustomer)
                                          .update({'status': '2'});
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return Tabbar1();
                                        },
                                      ));
                                    },
                                    child: Container(
                                      width: screenSize.width / 2.3,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(222, 224, 10, 10),
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
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('userlist')
                                          .doc(widget.idcustomer)
                                          .update({'status': '1'});
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return Tabbar1();
                                        },
                                      ));
                                    },
                                    child: Container(
                                      width: screenSize.width / 2.3,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(222, 1, 154, 100),
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
