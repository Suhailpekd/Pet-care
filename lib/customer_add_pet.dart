import 'package:flutter/material.dart';

class Customer_pet_add extends StatefulWidget {
  const Customer_pet_add({super.key});

  @override
  State<Customer_pet_add> createState() => _Customer_pet_addState();
}

class _Customer_pet_addState extends State<Customer_pet_add> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: Column(children: [
            Container(
                height: 170,
                color: Color.fromARGB(255, 164, 125, 111),
                child: Center(child: Text("Name"))),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 70),
                    child: Container(
                      height: 120,
                      width: screenSize.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.4,
                              color: Color.fromARGB(255, 189, 186, 181)),
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: screenSize.width * 0.3,
                              height: 120,
                              child: Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(19),
                                      child: Image.asset(
                                        "asset/catpic.jpg",
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(fontSize: 23),
                                ),
                                Text(
                                  "Age",
                                  style: TextStyle(fontSize: 23),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 163, 202, 234),
                backgroundImage: AssetImage(
                  "asset/Avatar-Profile-Vector-PNG-File.png",
                ),
                radius: 50,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 70),
              child: CircleAvatar(
                child: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 164, 125, 111),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 37,
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
