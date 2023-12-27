import 'package:flutter/material.dart';
import 'package:petcare/navigation/navigation.dart';

class Customeraprove extends StatefulWidget {
  const Customeraprove({super.key});

  @override
  State<Customeraprove> createState() => _CustomeraproveState();
}

class _CustomeraproveState extends State<Customeraprove> {
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
            Icon(
              Icons.arrow_back,
              size: 29,
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
                    "name",
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
                    "customer@gmail.com",
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
                    "9567972330",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
                height: 500,
                color: Colors.grey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 34, right: 34, bottom: 30, top: 380),
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
                ))
          ]),
        ),
      ),
    ]));
  }
}
