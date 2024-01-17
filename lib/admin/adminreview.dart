import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reviews extends StatefulWidget {
  var doctorid;

  Reviews({Key? key, required this.doctorid}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Reviews'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('ratings')
            .where('doctorId', isEqualTo: widget.doctorid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.data?.docs.isEmpty ?? true) {
            return Center(child: Text('No reviews available for this doctor.'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return ListTile(
                  title: Text("user name: ${data['userogId'].toString()}"),
                  subtitle: Text("Rating: ${data['rating'].toString()}"));
            }).toList(),
          );
        },
      ),
    );
  }
}
