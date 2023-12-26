import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Pet_rec_graph extends StatefulWidget {
  const Pet_rec_graph({super.key});

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
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 164, 125, 111)),
              height: 140 / 2,
              child: const Padding(
                padding: EdgeInsets.only(left: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
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
                  const Center(child: Text("Name")),
                  const Center(child: Text("Age")),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true),
                        titlesData: const FlTitlesData(show: true),
                        borderData: FlBorderData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(0, 3),
                              const FlSpot(1, 4),
                              const FlSpot(2, 3.5),
                              const FlSpot(3, 5),
                              const FlSpot(4, 4.5),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 4,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                        minY: 0,
                        // titlesData: const FlTitlesData(
                        //   leftTitles: SideTitles(showTitles: true),
                        //   bottomTitles: SideTitles(showTitles: true),
                        // ),
                        lineTouchData: const LineTouchData(enabled: true),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 77.0, right: 77.0, bottom: 70),
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
                            "Add",
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
