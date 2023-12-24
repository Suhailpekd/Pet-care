import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("asset/Screenshot.png"),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 145, bottom: 36),
            child: Text(
              "LOGIN",
              style: GoogleFonts.alkatra(
                  fontSize: 74, color: Color.fromARGB(255, 6, 6, 6)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 55,
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
                      hintText: "Email"),
                ),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset in x and y directions
                    ),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Center(
            child: Container(
              height: 55,
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
                      hintText: "Password"),
                ),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset in x and y directions
                    ),
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  // onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Forgotpassword(),
                  //     )),
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 37.0,
              right: 37.0,
            ),
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
                height: 45,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 234, 227, 236),
                        blurRadius: 8,
                        spreadRadius: 5,
                      )
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(child: Text("Continue")),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text("Don't have an account ?"),
              ),
              InkWell(
                // onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Reg(),
                // )),
                child: Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 45,
        )
      ]),
    );
  }
}
