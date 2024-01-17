import 'package:flutter/material.dart';
import 'package:petcare/navigation/navigation.dart';

// ignore: must_be_immutable
class Pet_rec_graph extends StatefulWidget {
  var name;
  var age;
  var height;
  var weight;
  var heartrate;
  Pet_rec_graph(
      {super.key,
      required this.name,
      required this.age,
      required this.height,
      required this.weight,
      required this.heartrate});

  @override
  State<Pet_rec_graph> createState() => _Pet_rec_graphState();
}

class _Pet_rec_graphState extends State<Pet_rec_graph> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 164, 125, 111)),
              height: 140 / 2,
              child: Padding(
                padding: EdgeInsets.only(left: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Adding_pet_rec(
                        //         userid: '',
                        //       ),
                        //     ));
                      },
                      child: SizedBox(
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 11),
                    child: SizedBox(
                      height: 139,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "asset/catpic.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name :  "),
                      Text("${widget.name}"),
                    ],
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age "),
                      Text("${widget.age}"),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 77.0, right: 77.0, bottom: 70),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navigation(),
                            ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 234, 227, 236),
                                blurRadius: 8,
                                spreadRadius: 5,
                              )
                            ],
                            color: Color.fromARGB(250, 2, 120, 63),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Text(
                          "Update",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
