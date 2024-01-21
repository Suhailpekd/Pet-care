// import 'dart:io';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcare/add_petgraphname/petrecord_graph.dart';
import 'package:petcare/usernavigations/user1st.dart';

// ignore: must_be_immutable
class AddingPetRec extends StatefulWidget {
  var useraid;
  var userid;
  AddingPetRec({super.key, required this.useraid, required this.userid});

  @override
  State<AddingPetRec> createState() => _AddingPetRecState();
}

class _AddingPetRecState extends State<AddingPetRec> {
  var name;
  var age;
  var height;
  var Weight;
  var heartrate;
  var bp;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }

    // ... (existing code)
  }

  Future<String> _uploadImage() async {
    if (image == null) {
      return ""; // No image selected
    }

    final storage = FirebaseStorage.instance;
    final ref =
        storage.ref().child('pet_images/${DateTime.now().toString()}.png');
    final uploadTask = ref.putFile(image!);

    await uploadTask.whenComplete(() => null);

    return await ref.getDownloadURL();
  }

  File? image;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Camera"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Gallery"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        height: 139,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: image != null
                              ? Image.file(image!)
                              : Image.asset("asset/addimage.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 34, top: 10, bottom: 4),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 27, right: 27),
                      child: Container(
                        height: 62,
                        width: double.infinity,
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your pets name';
                              }
                              return null;
                            },
                            onChanged: (value) => name = value,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                ),
                                hintText: "Enter pets name"),
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
                          const EdgeInsets.only(left: 38, top: 10, bottom: 4),
                      child: Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 27, right: 27),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your pets age';
                                }
                                return null;
                              },
                              onChanged: (value) => age = value,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                  ),
                                  hintText: "Enter pets age"),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14, top: 10),
                          child: SizedBox(
                            width: screenSize.width / 2.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Container(
                              height: 62,
                              width: screenSize.width / 2.5,
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter height';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => height = value,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11),
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
                              height: 62,
                              width: screenSize.width / 2.5,
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'enter weight';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => Weight = value,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11),
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
                        bottom: 4,
                        top: 10,
                      ),
                      child: Text(
                        "Heart rate",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your pets heart rate';
                                }
                                return null;
                              },
                              onChanged: (value) => heartrate = value,
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your bp';
                                }
                                return null;
                              },
                              onChanged: (value) => bp = value,
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
                              onTap: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  String imageUrl = await _uploadImage();
                                  await FirebaseFirestore.instance
                                      .collection("petlist")
                                      .add({
                                    "userid": widget.useraid,
                                    "name": name,
                                    "age": age,
                                    "height": height,
                                    "weight": Weight,
                                    "heartrate": heartrate,
                                    "bp": bp,
                                    "image_url": imageUrl,
                                    "petupheartrate": [heartrate],
                                    "petupheight": [height],
                                    "petupweight": [Weight],
                                    "petupbp": [bp]
                                    // Add the image URL here
                                  });

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Customer_pet_add()),
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 234, 227, 236),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                              ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
