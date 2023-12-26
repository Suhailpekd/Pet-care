import 'package:flutter/material.dart';

class Appointment_inner_page extends StatefulWidget {
  const Appointment_inner_page({super.key});

  @override
  State<Appointment_inner_page> createState() => _Appointment_inner_pageState();
}

class _Appointment_inner_pageState extends State<Appointment_inner_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Container(
            height: 260,
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 29,
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
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
                            Text("Name")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                          Text(
                              "with passion for animals and 2years of voterinery experience,with passion for animals and 2years of voterinery experience with passion for animals and 2years of voterinery experience"),
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
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text("Sheduled Time",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                              "with passion for animals and of voterinery experience,"),
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
                height: 150,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        height: 60,
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
                              Text("Amount"),
                            ],
                          ),
                        )))),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 75, right: 75, bottom: 10),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Catogories(),
                //     ));
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
                  "Booknow",
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
