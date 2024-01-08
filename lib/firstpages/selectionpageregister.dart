import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/registerpages/adminregistor.dart';
import 'package:petcare/registerpages/registor.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:petcare/registerpages/userregisterpage.dart';
import 'package:petcare/user/user1st.dart';

class User_selectionforreg extends StatefulWidget {
  const User_selectionforreg({super.key});

  @override
  State<User_selectionforreg> createState() => _User_selectionforregState();
}

class _User_selectionforregState extends State<User_selectionforreg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(
              "asset/Screenshot.png",
            ),
          ),
        ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 25, right: 25, top: 150),
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => Adminreg(),
        //             ));
        //       },
        // child: Container(
        //   height: 52,
        //   width: double.infinity,
        //   child: Padding(
        //     padding: const EdgeInsets.all(18.0),
        //     child: Text("Admin",
        //         style: TextStyle(
        //             color: Colors.white, fontWeight: FontWeight.bold)),
        //   ),
        //         decoration: BoxDecoration(
        //             color: Color.fromARGB(222, 192, 12, 12),
        //             borderRadius: BorderRadius.circular(12)),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 200,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 27),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginpage_doctor(),
                    ));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Doctor",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(222, 192, 12, 12),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Userreg(),
                    ));
              },
              child: Container(
                height: 52,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("User",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(222, 192, 12, 12),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       top: 190,
        //       left: 77.0,
        //       right: 77.0,
        //     ),
        //     child: InkWell(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => Navigation(),
        //             ));
        //       },
        //       child: Container(
        //         width: double.infinity,
        //         height: 50,
        //         decoration: BoxDecoration(
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Color.fromARGB(255, 234, 227, 236),
        //                 blurRadius: 8,
        //                 spreadRadius: 5,
        //               )
        //             ],
        //             color: Color.fromARGB(222, 192, 12, 12),
        //             borderRadius: BorderRadius.all(Radius.circular(10))),
        //         child: Center(
        //             child: Text(
        //           "Continue",
        //           style: TextStyle(fontSize: 16, color: Colors.white),
        //         )),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 45,
        )
      ]),
    );
  }
}
