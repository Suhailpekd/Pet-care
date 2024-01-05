import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/user/conformbooking/conformbook.dart';

class Cancelbooking extends StatefulWidget {
  const Cancelbooking({super.key});

  @override
  State<Cancelbooking> createState() => _CancelbookingState();
}

class _CancelbookingState extends State<Cancelbooking> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQueryData().size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Container(
            height: 235,
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
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
                height: 110,
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        height: 40,
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
            padding: EdgeInsets.only(top: 15, left: 75, right: 75, bottom: 10),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                        height: 300,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: []),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "25",
                                style: TextStyle(color: Colors.amber),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 48, right: 48),
                                child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [],
                                        color: Color.fromARGB(255, 1, 140, 112),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
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
                    color: Color.fromARGB(255, 221, 8, 4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  "Cancel Booking",
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
