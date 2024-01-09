import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:petcare/user/add_pet/adding_pet_rec.dart';

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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Adding_pet_rec(
                                userid: '',
                              ),
                            ));
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

//...........

                  // Container(
                  //   height: 100,
                  //   width: 100,
                  //   child: LineChart(
                  //     LineChartData(
                  //       // Define your line spots here
                  //       lineBarsData: [
                  //         LineChartBarData(
                  //           spots: [
                  //             FlSpot(0, 3),
                  //             FlSpot(1, 1),
                  //             FlSpot(2, 4),
                  //             FlSpot(3, 2),
                  //             FlSpot(4, 5),
                  //             FlSpot(5, 3),
                  //           ],
                  //           isCurved: true,
                  //           colors: [Colors.blue],
                  //           barWidth: 4,
                  //           isStrokeCapRound: true,
                  //           belowBarData: BarAreaData(show: false),
                  //         ),
                  //       ],
                  //       titlesData: FlTitlesData(
                  //         // Titles for x and y axes
                  //         leftTitles: SideTitles(
                  //             showTitles: true, reservedSize: 28, margin: 12),
                  //         bottomTitles: SideTitles(
                  //             showTitles: true, reservedSize: 28, margin: 12),
                  //       ),
                  //       borderData: FlBorderData(
                  //           show: true, border: Border.all(color: Colors.grey)),
                  //       gridData: FlGridData(show: true, horizontalInterval: 1),
                  //     ),
                  //   ),
                  // )

                  // Expanded(
                  //   child: LineChart(
                  //     LineChartData(
                  //       gridData: FlGridData(show: false),
                  //       titlesData: FlTitlesData(show: false),
                  //       borderData: FlBorderData(
                  //         show: true,
                  //         border: Border.all(
                  //           color: const Color(0xff37434d),
                  //           width: 1,
                  //         ),
                  //       ),
                  //       minX: 0,
                  //       maxX: 7,
                  //       minY: 0,
                  //       maxY: 6,
                  //       lineBarsData: [
                  //         LineChartBarData(
                  //           spots: [
                  //             FlSpot(0, 3),
                  //             FlSpot(1, 1),
                  //             FlSpot(2, 4),
                  //             FlSpot(3, 2),
                  //             FlSpot(4, 5),
                  //             FlSpot(5, 1),
                  //             FlSpot(6, 4),
                  //           ],
                  //           isCurved: true,
                  //           colors: [Colors.blue],
                  //           dotData: FlDotData(show: false),
                  //           belowBarData: BarAreaData(show: false),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Center(
                    child: Padding(
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
