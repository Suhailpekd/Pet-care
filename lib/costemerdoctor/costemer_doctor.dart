import 'package:flutter/material.dart';

class Customer_doctor extends StatefulWidget {
  const Customer_doctor({super.key});

  @override
  State<Customer_doctor> createState() => _Customer_doctorState();
}

class _Customer_doctorState extends State<Customer_doctor> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: Column(children: [
            Container(
                height: 170,
                color: Color.fromARGB(255, 164, 125, 111),
                child: Center(child: Text("Name"))),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 70),
                    child: Container(
                      height: 120,
                      width: screenSize.width * 0.9,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(208, 246, 222, 213),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenSize.width * 0.3,
                              height: 120,
                              color: Colors.white,
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "asset/Avatar-Profile-Vector-PNG-File.png",
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Name",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Location",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Available",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 132, 97)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Container(
                      height: 120,
                      width: screenSize.width * 0.9,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(208, 246, 222, 213),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenSize.width * 0.3,
                              height: 120,
                              color: Colors.white,
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        "asset/Avatar-Profile-Vector-PNG-File.png",
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Name",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Location",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Available",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 132, 97)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 163, 202, 234),
                backgroundImage: AssetImage(
                  "asset/Avatar-Profile-Vector-PNG-File.png",
                ),
                radius: 50,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 70),
              child: CircleAvatar(
                child: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 164, 125, 111),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 37,
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
