import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/user/conformbooking/conformbook.dart';

class Doctorappointments extends StatefulWidget {
  const Doctorappointments({super.key});

  @override
  State<Doctorappointments> createState() => _DoctorappointmentsState();
}

class _DoctorappointmentsState extends State<Doctorappointments> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQueryData().size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(children: [
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
                        Navigator.pop(context);
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
                              "asset/catpic.jpg",
                            ),
                            radius: 70,
                          ),
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
                        Text("Issue,"),
                        Text("Date"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 330,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Rejected',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Approved',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
