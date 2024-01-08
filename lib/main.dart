import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/doctoraprove.dart';
import 'package:petcare/admin/doctorlist.dart';
import 'package:petcare/admin/tabbar.dart';
import 'package:petcare/doctor/doctorhome.dart';
import 'package:petcare/registerpages/registor.dart';
import 'package:petcare/firebase_options.dart';
import 'package:petcare/firstpages/login.dart';
import 'package:petcare/firstpages/selectionpage_user.dart';
import 'package:petcare/firstpages/splash.dart';
import 'package:petcare/user/bookingappointment/appointment_inner_page.dart';
import 'package:petcare/user/profileuserediting/user_edit_profile.dart';
import 'admin/customeraprove.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: const
            // Loginpage()
            // Tabbar1());
            // Customer_pet_add(),
            // Customer_doctor());
            //  Appointment_inner_page());
            //Customeraprove());
            // Doctorhome());
            Splash_());
  }
}
