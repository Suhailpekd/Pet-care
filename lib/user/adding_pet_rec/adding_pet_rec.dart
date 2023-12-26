import 'package:flutter/material.dart';

class Adding_pet_rec extends StatefulWidget {
  const Adding_pet_rec({super.key});

  @override
  State<Adding_pet_rec> createState() => _Adding_pet_recState();
}

class _Adding_pet_recState extends State<Adding_pet_rec> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 120 / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: SizedBox(
                      height: 139,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "asset/catpic.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 34, top: 10, bottom: 7),
                    child: Text(
                      "Date",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27, right: 27),
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
                              width: 1.4,
                              color: Color.fromARGB(255, 200, 139, 6)),
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 38, top: 10, bottom: 7),
                    child: Text(
                      "Age",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 27, right: 27),
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
                                hintText: "Enter your age"),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.4,
                                color: Color.fromARGB(255, 200, 139, 6)),
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 36, top: 10),
                        child: SizedBox(
                          width: screenSize.width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18, top: 10),
                        child: SizedBox(
                          width: screenSize.width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 27),
                          child: Container(
                            height: 52,
                            width: screenSize.width / 2.5,
                            child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                    ),
                                    hintText: "Enter height"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.4,
                                    color: Color.fromARGB(255, 200, 139, 6)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 27),
                          child: Container(
                            height: 52,
                            width: screenSize.width / 2.5,
                            child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 11),
                                    ),
                                    hintText: "Enter weight"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.4,
                                    color: Color.fromARGB(255, 200, 139, 6)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 34,
                      bottom: 7,
                      top: 10,
                    ),
                    child: Text(
                      "Heart rate",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                                hintText: "Enter heart rate"),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.4,
                                color: Color.fromARGB(255, 200, 139, 6)),
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 34, bottom: 7, top: 10),
                    child: Text(
                      "Bp",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                                hintText: "Enter Bp"),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.4,
                                color: Color.fromARGB(255, 200, 139, 6)),
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 77.0, right: 77.0, bottom: 70),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "Add",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
