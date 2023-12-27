import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/firstpages/selectionpage_user.dart';

class Firstlogin extends StatefulWidget {
  const Firstlogin({super.key});

  @override
  State<Firstlogin> createState() => _FirstloginState();
}

class _FirstloginState extends State<Firstlogin> {
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
              "Login",
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
            "User name",
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
            "password",
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
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 11),
                      ),
                      hintText: "Enter your password"),
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
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 77.0,
              right: 77.0,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => User_selection(),
                    ));
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
                  "Login",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
              ),
            ),
          ),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Sign up"),
        )),
        SizedBox(
          height: 45,
        )
      ]),
    );
  }
}
