import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/add_petgraphname/button.dart';
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
  var petid;
  Pet_updates({
    super.key,
    required this.userid,
    required this.image,
    required this.age,
    required this.height,
    required this.weight,
    required this.heartrate,
    required this.bp,
    required this.petid,
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
      print("jnifi");
    });
  }

  Future<void> update() async {
    // Get the current date
    DateTime now = DateTime.now();
    setState(() {
      heightlist.add(height);
      datelistheight.add(
        '${now.year}-${(now.month)}-${(now.day)}'.toString(),
      );
    });

    // Update the "height" collection
    await FirebaseFirestore.instance.collection("height").add({
      "petid": widget.petid,
      "height": heightlist,
      "date": datelistheight,
    });

    // Update the "petlist" document
    await FirebaseFirestore.instance
        .collection("petlist")
        .doc(widget.petid)
        .update({"height": height});

    // The form is valid, proceed with navigation
    Navigator.pop(context);
  }

  DateTime now = DateTime.now();
  var datelistheight = [];
  var datelistweight = [];
  var datelistbp = [];
  var datelistheartrate = [];
  var heightlist = [];
  var weightlist = [];
  var bplist = [];
  var heartratelist = [];
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

//height update

                    InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 34,
                                          bottom: 4,
                                          top: 10,
                                        ),
                                        child: Text(
                                          "Height",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25, bottom: 20),
                                          child: Container(
                                            height: 62,
                                            width: double.infinity,
                                            child: Center(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Enter pets height';
                                                  }
                                                },
                                                onChanged: (value) =>
                                                    height = value,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    icon: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11),
                                                    ),
                                                    hintText:
                                                        "Enter Pets Height"),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.4,
                                                    color: Color.fromARGB(
                                                        255, 200, 139, 6)),
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              // Form is valid, proceed with the update
                                              await update();
                                            }
                                          },
                                          child: Updatebutton())
                                    ],
                                  ));
                        },
                        child: Updatebutton()),

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
                            data: <double>[double.parse(widget.weight)],
                          )),
                    ),

//weight update button

                    InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 34,
                                          bottom: 4,
                                          top: 10,
                                        ),
                                        child: Text(
                                          "Weight",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25, bottom: 20),
                                          child: Container(
                                            height: 62,
                                            width: double.infinity,
                                            child: Center(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Enter pets weight';
                                                  }
                                                },
                                                onChanged: (value) =>
                                                    Weight = value,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    icon: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11),
                                                    ),
                                                    hintText:
                                                        "Enter Pets Weight"),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.4,
                                                    color: Color.fromARGB(
                                                        255, 200, 139, 6)),
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            if (formKey.currentState
                                                    ?.validate() ??
                                                false) {}
                                            setState(() {
                                              weightlist.add(Weight);
                                              datelistweight.add(
                                                '${now.year}-${(now.month)}-${(now.day)}'
                                                    .toString(),
                                              );
                                            });
                                            await FirebaseFirestore.instance
                                                .collection("weight")
                                                .add({
                                              "petid": widget.petid,
                                              "weight": weightlist,
                                              "date": datelistweight
                                            });
                                            await FirebaseFirestore.instance
                                                .collection("petlist")
                                                .doc(widget.petid)
                                                .update({
                                              "weight": Weight
                                            }).then((value) =>
                                                    Navigator.pop(context));
                                          },
                                          child: Updatebutton())
                                    ],
                                  ));
                        },
                        child: Updatebutton()),

//bp update

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 36),
                      child: Text(
                        "BP",
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

//weight update button

                    InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 34,
                                          bottom: 4,
                                          top: 10,
                                        ),
                                        child: Text(
                                          "BP",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25, bottom: 20),
                                          child: Container(
                                            height: 62,
                                            width: double.infinity,
                                            child: Center(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Enter pets bp';
                                                  }
                                                  if (double.tryParse(value) ==
                                                      null) {
                                                    return 'Please enter a valid number for pet\'s bp';
                                                  }
                                                },
                                                onChanged: (value) =>
                                                    bp = value,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    icon: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11),
                                                    ),
                                                    hintText: "Enter Pets bp"),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.4,
                                                    color: Color.fromARGB(
                                                        255, 200, 139, 6)),
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            setState(() {
                                              bplist.add(bp);
                                              datelistbp.add(
                                                '${now.year}-${(now.month)}-${(now.day)}'
                                                    .toString(),
                                              );
                                            });
                                            await FirebaseFirestore.instance
                                                .collection("bp")
                                                .add({
                                              "petid": widget.petid,
                                              "bp": bplist,
                                              "date": datelistbp
                                            });
                                            await FirebaseFirestore.instance
                                                .collection("petlist")
                                                .doc(widget.petid)
                                                .update({"bp": bp}).then(
                                              (value) => Fluttertoast.showToast(
                                                  msg: "bp upadated"),
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: Updatebutton())
                                    ],
                                  ));
                        },
                        child: Updatebutton()),

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
                    InkWell(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 34,
                                          bottom: 4,
                                          top: 10,
                                        ),
                                        child: Text(
                                          "Heart Rate",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25, bottom: 20),
                                          child: Container(
                                            height: 62,
                                            width: double.infinity,
                                            child: Center(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Enter bp';
                                                  }
                                                },
                                                onChanged: (value) =>
                                                    heartrate = value,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    icon: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11),
                                                    ),
                                                    hintText:
                                                        "Enter Pets heartrate"),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.4,
                                                    color: Color.fromARGB(
                                                        255, 200, 139, 6)),
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            setState(() {
                                              heartratelist.add(heartrate);
                                              datelistheartrate.add(
                                                '${now.year}-${(now.month)}-${(now.day)}'
                                                    .toString(),
                                              );
                                            });
                                            await FirebaseFirestore.instance
                                                .collection("heartrate")
                                                .add({
                                              "petsid": widget.petid,
                                              "heartrate": heartratelist,
                                              "date": datelistheartrate
                                            }).then((value) =>
                                                    Navigator.pop(context));
                                          },
                                          child: Updatebutton())
                                    ],
                                  ));
                        },
                        child: Updatebutton()),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 38, top: 10, bottom: 4),
                      child: Text(
                        "Pets Age : ${widget.age}",
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
                              keyboardType: TextInputType.number,
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
                                  hintText: "Enter pets age for update"),
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
                      padding: const EdgeInsets.only(top: 15.0, bottom: 40),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.age = age;
                            });
                            FirebaseFirestore.instance
                                .collection("petlist")
                                .doc(widget.petid)
                                .update({"age": age}).then((value) =>
                                    Fluttertoast.showToast(msg: "Age Updated"));
                          },
                          child: Updatebutton()),
                    )
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
