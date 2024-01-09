import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/doctoraprove.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/user/add_pet/adding_pet_rec.dart';
import 'package:petcare/user/add_pet/addpetsupdate.dart';
import 'package:petcare/user/profileuserediting/user_edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer_pet_add extends StatefulWidget {
  const Customer_pet_add({super.key});

  @override
  State<Customer_pet_add> createState() => _Customer_pet_addState();
}

class _Customer_pet_addState extends State<Customer_pet_add> {
  var userId = "";
  var userogid = "";

  @override
  void initState() {
    super.initState();
    // Call your function to retrieve user ID here
    retrieveUserID();
  }

  Future<dynamic> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('name') ?? ''.toString();
      userogid = prefs.getString("id") ?? "".toString();
      // Retrieve the user ID
    });
  }

  //   Future<List<QueryDocumentSnapshot>> fetchData() async {
  //   try {
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection("userlis").get();
  //     return querySnapshot.docs;
  //   } catch (e) {
  //     // Handle errors, log or display a meaningful error message.
  //     print("Error fetching data: $e");
  //     return [];
  //   }
  // }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("petlist")
          .where("userid", isEqualTo: userogid)
          .get();
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
            SizedBox(
              height: 190,
              child: Container(
                  height: 10,
                  color: Color.fromARGB(255, 164, 125, 111),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Center(
                        child: Text(
                      userId,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('petlist')
                  .where("userid", isEqualTo: userogid)
                  .get(),
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

                // String petId = documents[0].id;

                if (documents.isNotEmpty) {
                  var customerId = documents[0].id;
                  var name = documents[0]["name"];

                  // String department = documents[0]["age"];
                  // String email = customerSnapshot.docs[0]["email"];
                  // String fees = customerSnapshot.docs[0]["fees"];
                  // String qualification = customerSnapshot.docs[0]
                  //     ["qualification"]; // Retrieve the ID from the first document
                  Future<void> share() async {
                    SharedPreferences spref =
                        await SharedPreferences.getInstance();
                    spref.setString('idpet', customerId);
                    spref.setString('namepet', name);
                  }
                }
                // spref.setString('agepet', age);
                // spref.setString('department', department);
                // spref.setString('fees', fees); // Save the user ID to SharedPreferences
                // spref.setString('qualification', qualification);

                return Expanded(
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Access data from each document in the collection
                      Map<String, dynamic> data =
                          documents[index].data() as Map<String, dynamic>;
                      var age = documents[0]["age"];
                      var height = documents[0]["height"];
                      var weight = documents[0]["weight"];
                      var heartrate = documents[0]["heartrate"];
                      var bp = documents[0]["bp"];
                      // Create a Container using the data
                      return Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Updatepet(
                                    data: data,
                                    userid: userogid,
                                  ),
                                ));
                          },
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
                                    width: 100,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          data["name"].toString(),
                                          style: TextStyle(fontSize: 23),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          data["age"].toString(),
                                          style: TextStyle(fontSize: 23),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
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
                              builder: (context) =>
                                  Adding_pet_rec(userid: userogid),
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