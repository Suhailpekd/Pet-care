import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:petcare/user/appointment_inner_page/appoinmentouter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Customer_booking extends StatefulWidget {
  const Customer_booking({super.key});

  @override
  State<Customer_booking> createState() => _Customer_bookingState();
}

class _Customer_bookingState extends State<Customer_booking> {
  @override
  var name;

  void initState() {
    retrieveUserID();
    print(name);
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 170,
                color: Color.fromARGB(255, 164, 125, 111),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 73,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 163, 202, 234),
                            backgroundImage: AssetImage(
                              "asset/Avatar-Profile-Vector-PNG-File.png",
                            ),
                            radius: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(name.toString()),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(33),
                        topRight: Radius.circular(33)),
                    color: const Color.fromARGB(255, 251, 251, 251),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Appoinment",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cancelbooking(),
                                  )),
                              child: Container(
                                height: 120,
                                width: screenSize.width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(255, 164, 125, 111),
                                    ),
                                    color: Color.fromARGB(208, 255, 255, 255),
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
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  "asset/Avatar-Profile-Vector-PNG-File.png",
                                                  fit: BoxFit.cover,
                                                ))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "dr.Name",
                                              style: TextStyle(fontSize: 23),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Date",
                                              style: TextStyle(fontSize: 23),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Time",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: RatingBar(
                                        filledIcon: Icons.star,
                                        size: screenSize.width / 20,
                                        emptyIcon: Icons.star_border,
                                        onRatingChanged: (value) =>
                                            debugPrint('$value'),
                                        initialRating: 3,
                                        maxRating: 5,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 17,
                              left: 20,
                              right: 20,
                            ),
                            child: Container(
                              height: 120,
                              width: screenSize.width * 0.9,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 164, 125, 111),
                                  ),
                                  color: Color.fromARGB(208, 255, 255, 255),
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
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.asset(
                                                "asset/Avatar-Profile-Vector-PNG-File.png",
                                                fit: BoxFit.cover,
                                              ))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "dr.Name",
                                            style: TextStyle(fontSize: 23),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Date",
                                            style: TextStyle(fontSize: 23),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Time",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: RatingBar(
                                      filledIcon: Icons.star,
                                      size: screenSize.width / 20,
                                      emptyIcon: Icons.star_border,
                                      onRatingChanged: (value) =>
                                          debugPrint('$value'),
                                      initialRating: 3,
                                      maxRating: 5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
