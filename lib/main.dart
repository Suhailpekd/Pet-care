import 'package:flutter/material.dart';
import 'package:petcare/admin/doctoraprove.dart';
import 'package:petcare/admin/doctorlist.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/doctor/registor.dart';
import 'package:petcare/firstpages/login.dart';
import 'package:petcare/firstpages/selectionpage_user.dart';
import 'package:petcare/firstpages/splash.dart';
import 'package:petcare/user/appointment_inner_page/appointment_inner_page.dart';
import 'package:petcare/user/userediting/user_edit_profile.dart';
import 'admin/customeraprove.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash_());
    // Loginpage()
    // Tabbar1());
    // Customer_pet_add(),
    // Customer_doctor());
    //  Appointment_inner_page());
    //Customeraprove());
  }
}
