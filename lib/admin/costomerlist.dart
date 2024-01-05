import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:petcare/admin/customeraprove.dart';

class Customerlist extends StatefulWidget {
  const Customerlist({super.key});

  @override
  State<Customerlist> createState() => _CustomerlistState();
}

class _CustomerlistState extends State<Customerlist> {
  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("userlist").get();
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('userlist').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

        return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              // Access data from each document in the collection
              Map<String, dynamic> data =
                  documents[index].data() as Map<String, dynamic>;
              // Create a Container using the data
              return Padding(
                padding: EdgeInsets.only(
                  top: 17,
                  left: 20,
                  right: 20,
                ),
                child: InkWell(
                  onTap: () {
                    var doc1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Customeraprove(
                                doc: data["name"],
                                doc1: data["email"],
                                doc2: data["phone"],
                                id1: data["id"])));
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
                                  data["name"].toString(),
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data["age"].toString(),
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data["location"].toString(),
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
              );
            });
      },
    ));
  }
}
