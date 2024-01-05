import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:petcare/doctor/docterpetapprove.dart';
import 'package:petcare/doctor/doctoredit.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/user/admin/adminlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Doctorhome extends StatefulWidget {
  const Doctorhome({super.key});

  @override
  State<Doctorhome> createState() => _DoctorhomeState();
}

class _DoctorhomeState extends State<Doctorhome> {
//   @override
//   void initState() {
//     super.initState();
//     // Call your function to retrieve user ID here
//     retrieveUserID();
//   }
//   Future<dynamic> retrieveUserID() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String userId = prefs.getString('name') ?? ''; // Retrieve the user ID

// return userId;
//   }

  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      SizedBox(child: logout1()),
      Container(
        height: 170,
        color: Color.fromARGB(255, 164, 125, 111),
        child: Padding(
          padding: const EdgeInsets.only(right: 32, left: 32, top: 30),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(top: 37),
                child: Container(
                  child: Center(
                    child: Text(
                      "token",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  height: 47,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 1.5)),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 163, 202, 234),
                    backgroundImage: AssetImage(
                      "asset/Avatar-Profile-Vector-PNG-File.png",
                    ),
                    radius: 40,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 55, top: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Doctorproedit()));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ]),
        ),
      ),
      Expanded(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Doctorappointments()));
                        },
                        child: SizedBox(
                          width: screenSize.width / 2.55,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "asset/catpic.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Text("Issue"),
                      Text("Date"),
                      Text("Time"),
                    ],
                  ),
                  height: 190,
                  width: screenSize.width / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Color.fromARGB(255, 109, 74, 5), width: 1.5)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Doctorappointments()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenSize.width / 2.55,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "asset/catpic.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text("Issue"),
                        Text("Date"),
                        Text("Time"),
                      ],
                    ),
                    height: 190,
                    width: screenSize.width / 2.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Color.fromARGB(255, 109, 74, 5),
                            width: 1.5)),
                  ),
                ),
              ],
            ),
          ),
        ]),
      )
    ])));
  }
}














// Stack(
//       children: [
//       
//         ]),
//         Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 30, top: 125),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   CircleAvatar(
//                     radius: 18,
//                     child: Center(
//                       child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.edit,
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }
