import 'package:flutter/material.dart';
import 'package:petcare/firstpages/login.dart';
import 'package:petcare/user/admin/adminlogin.dart';

class logout1 extends StatelessWidget {
  const logout1({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 20,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Firstlogin();
            },
          ));
        },
        icon: Icon(Icons.logout));
  }
}
