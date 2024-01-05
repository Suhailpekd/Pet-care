import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/firstpages/selectionpageregister.dart';
import 'package:petcare/registerpages/registor.dart';
import 'package:petcare/firstpages/selectionpage_user.dart';
import 'package:petcare/navigation/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firstlogin extends StatefulWidget {
  const Firstlogin({super.key});

  @override
  State<Firstlogin> createState() => _FirstloginState();
}

class _FirstloginState extends State<Firstlogin> {
  var email = TextEditingController();
  var password = TextEditingController();

  Future<void> loginUser() async {
    try {
      const String adminEmail = 'admin@gmail.com';
      const String adminPassword = 'admin@123';

      if (email.text == adminEmail && password.text == adminPassword) {
        Fluttertoast.showToast(msg: 'Login Successful as Admin');
        //Redirect to the admin home page
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Tabbar1();
        }));
        return;
      }
      // Check if the user with the provided email and password exists in the customers' table
      final QuerySnapshot<Map<String, dynamic>> customerSnapshot =
          await FirebaseFirestore.instance
              .collection('doctorlist')
              .where('email', isEqualTo: email.text)
              .where('password', isEqualTo: password.text)
              // .where('status', isEqualTo: '1')
              .get();

      if (customerSnapshot.docs.isNotEmpty) {
        // String customerId = customerSnapshot
        //     .docs[4].id; // Retrieve the ID from the first document

        // SharedPreferences spref = await SharedPreferences.getInstance();
        // spref.setString(
        //     'name', customerId

        //     ); // Save the user ID to SharedPreferences

        // Fluttertoast.showToast(msg: 'Login Successful as Doctor');
        // print('Customer ID: $customerId');

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Doctorhome();
        }));
        return;
      }
      final QuerySnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('userlist')
              .where('email', isEqualTo: email.text)
              .where('password', isEqualTo: password.text)
              // .where('status', isEqualTo: '1')
              .get();
      if (userSnapshot.docs.isNotEmpty) {
        // print('object');
        var name = userSnapshot.docs[0]['name'];
        String email = userSnapshot.docs[0]["email"];
        String location = userSnapshot.docs[0]["location"];
        String contact = userSnapshot.docs[0]["phone"];
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$location');
        var id = userSnapshot.docs[0].id
            .toString(); // Retrieve the ID from the first document

        SharedPreferences spref = await SharedPreferences.getInstance();
        spref.setString('name', name);
        spref.setString('email', email);
        spref.setString('location', location);
        spref.setString('contact', contact);
        spref.setString('id', id); // Save the user ID to SharedPreferences

        Fluttertoast.showToast(msg: 'Login Successful as user');
        print('Customer ID: $name');
        // String userId = userSnapshot.docs[0].id;

        // SharedPreferences spref = await SharedPreferences.getInstance();
        // spref.setString('user_id', userId);

        // print('Customer ID: $userId');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Navigation();
        }));
      } else {
        print("object");
      }
    } catch (e) {
      print('Error logging in:');
      // Handle errors and show an error message to the user if needed
    }
  }

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
                  controller: email,
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
                  controller: password,
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
                loginUser();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => User_selection(),
                //     ));
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
          padding: EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => User_selectionforreg()));
              },
              child: Text("Sign up")),
        )),
        SizedBox(
          height: 45,
        )
      ]),
    );
  }
}
