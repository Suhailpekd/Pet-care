import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/navigation/navigation.dart';

class Userreg extends StatefulWidget {
  const Userreg({super.key});
  @override
  State<Userreg> createState() => _UserregState();
}

class _UserregState extends State<Userreg> {
  var name = '';
  var email = "";
  var password = "";

  var contact = "";
  var location = "";
  var phone = "";

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
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 30),
            child: Text(
              "REGISTER",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color.fromARGB(255, 200, 139, 6)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 34, bottom: 5),
          child: Text(
            "name",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 52,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => name = value,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Enter your name"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.4, color: Color.fromARGB(255, 200, 139, 6)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 34, bottom: 5, top: 15),
          child: Text(
            "email",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 52,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Enter your email"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.4, color: Color.fromARGB(255, 200, 139, 6)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 34, bottom: 5, top: 15),
          child: Text(
            "Contact",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 52,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => phone = value,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Enter your number"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.4, color: Color.fromARGB(255, 200, 139, 6)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 34, bottom: 5, top: 15),
          child: Text(
            "Location",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 52,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => location = value,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Enter your location"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.4, color: Color.fromARGB(255, 200, 139, 6)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 34, bottom: 5, top: 15),
          child: Text(
            "Password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 52,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Enter your passwrd"),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.4, color: Color.fromARGB(255, 200, 139, 6)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),

//

        // Padding(
        //   padding: const EdgeInsets.only(left: 34, bottom: 5, top: 15),
        //   child: Text(
        //     "Fees",
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        //   ),
        // ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 25, right: 25),
        //     child: Container(
        //       height: 52,
        //       width: double.infinity,
        //       child: Center(
        //         child: TextFormField(onChanged: (value) => fees=value,
        //           decoration: InputDecoration(
        //               enabledBorder: InputBorder.none,
        //               disabledBorder: InputBorder.none,
        //               focusedBorder: InputBorder.none,
        //               icon: Padding(
        //                 padding: const EdgeInsets.only(left: 11),
        //               ),
        //               hintText: "Enter Fees"),
        //         ),
        //       ),
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //               width: 1.4, color: Color.fromARGB(255, 200, 139, 6)),
        //           color: Color.fromARGB(255, 255, 255, 255),
        //           borderRadius: BorderRadius.circular(12)),
        //     ),
        //   ),
        // ),

        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 77.0,
              right: 77.0,
            ),
            child: InkWell(
              onTap: () async {
                if (name.isEmpty ||
                    email.isEmpty ||
                    password.isEmpty ||
                    // contact.isEmpty ||
                    location.isEmpty ||
                    phone.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 245, 245, 245),
                                border: Border.all(
                                    width: 2,
                                    color: const Color.fromARGB(
                                        255, 205, 58, 58))),
                            height: 40,
                            child: Text(
                              "Fill All Fields",
                              style: TextStyle(fontSize: 15),
                            ),
                          )));
                } else {
                  await FirebaseFirestore.instance.collection("userlist").add({
                    "name": name,
                    "email": email,
                    "password": password,
                    "location": location,
                    "phone": phone
                  }).then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navigation(),
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
                    color: Color.fromARGB(222, 192, 12, 12),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  "Register",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 45,
        )
      ]),
    );
  }
}
