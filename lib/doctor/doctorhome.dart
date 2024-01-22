import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:petcare/doctor/docterpetapprove.dart';
import 'package:petcare/editprofiles/doctoredit.dart';
import 'package:petcare/logoutbuttun.dart';
import 'package:petcare/user/admin/adminlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Doctorhome extends StatefulWidget {
  var cunt;
  Doctorhome({super.key, required this.cunt});

  @override
  State<Doctorhome> createState() => _DoctorhomeState();
}

class _DoctorhomeState extends State<Doctorhome> {
  String userId = "";
  String username = '';
  var counted = "";
  var available = "";
  var petid = "";
  @override
  void initState() {
    super.initState();
    // Call your function to retrieve user ID here
    retrieveUserID();
  }

  Future<void> retrieveUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('name') ?? ''.toString();
    userId = prefs.getString('id') ?? ''.toString();
    counted = prefs.getString('count') ?? "".toString();
    available = prefs.getString("available") ?? "".toString();

    print(userId);
    print(counted); // Retrieve the user ID
  }

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("appoinments")
          .where("doctorid", isEqualTo: userId)
          .get();
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  var imageurl = "";
  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [logout1()],
        ),
        body: Column(children: [
          Container(
            height: 170,
            color: Color.fromARGB(255, 164, 125, 111),
            child: Padding(
              padding: const EdgeInsets.only(right: 32, left: 32, top: 30),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 37),
                        child: Container(
                          child: Center(
                            child: Text(
                              widget.cunt.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          height: 47,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                        ),
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 163, 202, 234),
                            backgroundImage: AssetImage(
                              "asset/Avatar-Profile-Vector-PNG-File.png",
                            ),
                            radius: 40,
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 55, top: 34),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      child: Center(
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Doctorproedit()));
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              ]),
            ),
          ),
          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('appoinments')
                  .where("doctorid", isEqualTo: userId)
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
                  String customerId = documents[0].id;
                  String name = documents[0]["name"];
                  imageurl = documents[0]["image"];
                  petid = documents[0]["option1"];

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
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 170),
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        final data =
                            documents[index].data() as Map<String, dynamic>;
                        // documents[index].id;
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Doctorappointments(
                                            username: data["username"],
                                            bookdate: data["date"],
                                            bookedtime: data["time"],
                                            image: imageurl,
                                            appointmentid: documents[index].id,
                                            petid: petid,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width / 2,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          imageurl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        " Name:${data["username"]}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Date:${data["date"]}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Time:${data["time"]}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                height: 250,
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 109, 74, 5),
                                        width: 1.5)),
                              ),
                            ));
                      }),
                );
              }),
        ]));
  }
}
          
              















// Stack(
//       children: [
//       
//         ]),
//         Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 30, top: 125),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   CircleAvatar(
//                     radius: 18,
//                     child: Center(
//                       child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.edit,
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }
