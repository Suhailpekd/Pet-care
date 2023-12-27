import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/customeraprove.dart';

class Customerlist extends StatefulWidget {
  const Customerlist({super.key});

  @override
  State<Customerlist> createState() => _CustomerlistState();
}

class _CustomerlistState extends State<Customerlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            top: 17,
            left: 20,
            right: 20,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Customeraprove()));
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  // border: Border.all(
                  //   width: 1,
                  //   color: Color.fromARGB(255, 164, 125, 111),
                  // ),
                  color: Color.fromARGB(255, 164, 125, 111),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      color: Color.fromARGB(255, 164, 125, 111),
                      child: Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "asset/Avatar-Profile-Vector-PNG-File.png",
                                fit: BoxFit.cover,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Jhon",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "21 years",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Calicut Kerala",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "see more",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
