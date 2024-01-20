import 'package:flutter/material.dart';

class Updatebutton extends StatelessWidget {
  const Updatebutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 234, 227, 236),
                blurRadius: 8,
                spreadRadius: 5,
              )
            ],
            color: Color.fromARGB(250, 2, 120, 63),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
            child: Text(
          "Update",
          style: TextStyle(fontSize: 16, color: Colors.white),
        )),
      ),
    );
  }
}
