import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/add_petgraphname/petrecord_graph.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Pet_updates extends StatefulWidget {
  var userid;
  var image;
  var age;
  var height;
  var weight;
  var heartrate;
  var bp;

  Pet_updates({
    super.key,
    required this.userid,
    required this.image,
    required this.age,
    required this.height,
    required this.weight,
    required this.heartrate,
    required this.bp,
  });

  @override
  State<Pet_updates> createState() => _Pet_updatesState();
}

class _Pet_updatesState extends State<Pet_updates> {
  @override
  void initState() {
    super.initState();
    setState(() {
      name = widget.userid;
      age = widget.age;
      height = widget.height;
      Weight = widget.weight;
      heartrate = widget.heartrate;
      bp = widget.bp;
    });
  }

  var name = "";
  var age = "";
  var height = "";
  var Weight = "";
  var heartrate = "";
  var bp = "";
  var ids = "";
  Future<void> share() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ids = spref.getString('idpet')!;
    });
    print(ids);

    // var idsrrr = spref.setString('namepet', name);
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: SizedBox(
                        height: 139,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 36),
                      child: Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                          width: screenSize.width,
                          height: screenSize.height / 4,
                          child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[double.parse(widget.height)],
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 36),
                      child: Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                          width: screenSize.width,
                          height: screenSize.height / 4,
                          child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[double.parse(widget.bp)],
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 36),
                      child: Text(
                        "Heart Rate",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                          width: screenSize.width,
                          height: screenSize.height / 4,
                          child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[double.parse(widget.heartrate)],
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 36),
                      child: Text(
                        "B P",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                          width: screenSize.width,
                          height: screenSize.height / 4,
                          child: SfSparkLineChart(
                            //Enable the trackball
                            trackball: SparkChartTrackball(
                                activationMode: SparkChartActivationMode.tap),
                            //Enable marker
                            marker: SparkChartMarker(
                                displayMode: SparkChartMarkerDisplayMode.all),
                            //Enable data label
                            labelDisplayMode: SparkChartLabelDisplayMode.all,
                            data: <double>[double.parse(widget.bp)],
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 38, top: 10, bottom: 4),
                      child: Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 27, right: 27),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter pets age';
                                }
                              },
                              onChanged: (value) => age = value,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                  ),
                                  hintText: "Enter your age"),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.4,
                                  color: Color.fromARGB(255, 200, 139, 6)),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 36, top: 10),
                          child: SizedBox(
                            width: screenSize.width / 2.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Height",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14, top: 10),
                          child: SizedBox(
                            width: screenSize.width / 2.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Container(
                              height: 62,
                              width: screenSize.width / 2.5,
                              child: Center(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Height';
                                    }
                                  },
                                  onChanged: (value) => height = value,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11),
                                      ),
                                      hintText: "Enter height"),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.4,
                                      color: Color.fromARGB(255, 200, 139, 6)),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 27),
                            child: Container(
                              height: 62,
                              width: screenSize.width / 2.5,
                              child: Center(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter weight';
                                    }
                                  },
                                  onChanged: (value) => Weight = value,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11),
                                      ),
                                      hintText: "Enter weight"),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.4,
                                      color: Color.fromARGB(255, 200, 139, 6)),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 34,
                        bottom: 4,
                        top: 10,
                      ),
                      child: Text(
                        "Heart rate",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter heart rate';
                                }
                              },
                              onChanged: (value) => heartrate = value,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                  ),
                                  hintText: "Enter heart rate"),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.4,
                                  color: Color.fromARGB(255, 200, 139, 6)),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 34, bottom: 7, top: 10),
                      child: Text(
                        "Bp",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter pets BP';
                                }
                              },
                              onChanged: (value) => bp = value,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                  ),
                                  hintText: "Enter Bp"),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.4,
                                  color: Color.fromARGB(255, 200, 139, 6)),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 77.0, right: 77.0, bottom: 70),
                        child: InkWell(
                          onTap: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              await share();

                              await FirebaseFirestore.instance
                                  .collection("petlist")
                                  .doc(ids)
                                  .update({
                                "age": age,
                                "height": height,
                                "weight": Weight,
                                "heartrate": heartrate,
                                "bp": bp
                              });

                              await FirebaseFirestore.instance
                                  .collection("petupdates")
                                  .add({
                                "userid": "${ids}",
                                "age": age,
                                "height": height,
                                "weight": Weight,
                                "heartrate": heartrate,
                                "bp": bp
                              }).then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pet_rec_graph(
                                          name: name,
                                          age: age,
                                          height: height,
                                          weight: Weight,
                                          heartrate: heartrate,
                                        ),
                                      )));
                            }
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
                                color: Color.fromARGB(250, 2, 120, 63),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text(
                              "Update",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
      ),
    );
  }
}
