import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/doctoraprove.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/user/adding_pet_rec/adding_pet_rec.dart';
import 'package:petcare/user/userediting/user_edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer_pet_add extends StatefulWidget {
  const Customer_pet_add({super.key});

  @override
  State<Customer_pet_add> createState() => _Customer_pet_addState();
}

class _Customer_pet_addState extends State<Customer_pet_add> {
  var userId = "";

  @override
  void initState() {
    super.initState();
    // Call your function to retrieve user ID here
    retrieveUserID();
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('name') ?? ''; // Retrieve the user ID
    });
  }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("petlist").get();
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: Column(children: [
            logout1(),
            Container(
                height: 170,
                color: Color.fromARGB(255, 164, 125, 111),
                child: Center(child: Text(userId))),

            SizedBox(
              height: 55,
            ),

            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('petlist').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No data available'));
                }

                // Extract the documents from the snapshot
                final List<DocumentSnapshot> documents = snapshot.data!.docs;

                return Expanded(
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Access data from each document in the collection
                      Map<String, dynamic> data =
                          documents[index].data() as Map<String, dynamic>;
                      // Create a Container using the data
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          child: Image.asset(
                                            "asset/catpic.jpg",
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 27, top: 27),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["name"].toString(),
                                      style: TextStyle(fontSize: 23),
                                    ),
                                    Text(
                                      data["age"].toString(),
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       Padding(
            //         padding:
            //             const EdgeInsets.only(left: 20, right: 20, top: 70),
            //         child: Container(
            //           height: 120,
            //           width: screenSize.width * 0.9,
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //                   width: 1.4,
            //                   color: Color.fromARGB(255, 189, 186, 181)),
            //               color: Color.fromARGB(255, 255, 255, 255),
            //               borderRadius: BorderRadius.circular(12)),
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: SizedBox(
            //                   width: screenSize.width * 0.3,
            //                   height: 120,
            //                   child: Center(
            //                       child: ClipRRect(
            //                           borderRadius: BorderRadius.circular(19),
            //                           child: Image.asset(
            //                             "asset/catpic.jpg",
            //                             fit: BoxFit.cover,
            //                           ))),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(top: 30, left: 27),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "Name",
            //                       style: TextStyle(fontSize: 23),
            //                     ),
            //                     Text(
            //                       "Age",
            //                       style: TextStyle(fontSize: 23),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 70),
            child: CircleAvatar(
              child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => User_profile_edit(),
                        ));
                  }),
            ),
          )
        ]),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Adding_pet_rec(),
                            ));
                      },
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
