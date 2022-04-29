import 'dart:io';

import 'package:big_reward/home.dart';
import 'package:big_reward/settings.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;

  final picker = ImagePicker();
  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future getImage() async {
    //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //   setState(() {
    //     _image = image as File;
    //     print("Image Path $_image");
    //   });
    // }
    //  Future uploadPic(BuildContext context) async{
    //    FirebaseStorage storage = FirebaseStorage.instance;
    //   String fileName = basename(_image.path);

    //    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    //    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    //    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    //    setState(() {
    //       print("Profile Picture uploaded");
    //       Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    //    });
    // }

    return Scaffold(
        backgroundColor: Color(0XFF244198),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xffF2BC1A), width: 0.5),
                      ),
                      child: imageFile != null
                          ? Image.file(
                              imageFile!,
                              fit: BoxFit.fill,
                            )
                          : GestureDetector(
                              onTap: () {
                                chooseImage(ImageSource.gallery);
                              },
                              child: Image.asset(
                                "images/profile.png",
                                fit: BoxFit.cover,
                              )),
                      // child: Image.asset(
                      //   "images/profile.png",
                      //   width: 30,
                      //   height: 30,
                      //   color: Color(0xffF2BC1A),
                      // ),
                      // child: Image.asset("Images/user.png"),
                    ),
                    IconButton(
                      onPressed: () {
                        chooseImage(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Color(0xffF2BC1A),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Davies Smith",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("images/coin.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("75 Coins",
                                    style: TextStyle(
                                      color: Color(0xffF2BC1A),
                                      fontSize: 16,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            "Goa,India",
                            style: TextStyle(
                              color: Color(0xffF2BC1A),
                              fontSize: 25,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // ProfilePage(BuildContext context) =>
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => SettingsPage(),
                            //     ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.settings,
                                    color: Color(0xffF2BC1A),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Settings",
                                      style: TextStyle(
                                        color: Color(0xffF2BC1A),
                                        fontSize: 16,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffF2BC1A), width: 1),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Text(
                          "Your Points",
                          style: TextStyle(
                              color: Color(0xffF2BC1A),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("images/coinpic.png"),
                          ),
                          Text("43 Points",
                              style: TextStyle(
                                color: Color(0xffF2BC1A),
                                fontSize: 20,
                              )),
                          Image.asset("images/divider.png"),
                          Image.asset("images/coinpic.png"),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text("100 Win Points",
                                style: TextStyle(
                                  color: Color(0xffF2BC1A),
                                  fontSize: 20,
                                )),
                          ),
                        ],
                      )
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffF2BC1A), width: 1),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Refer & Earn",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Share this app and your score on various platform and get rewards",
                      style: TextStyle(
                        color: Color(0xffF2BC1A),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffF2BC1A),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                "images/copylink.png",
                                height: 30,
                                fit: BoxFit.cover,
                              )),
                        ),
                        // Image.asset("images/instagram.png"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            child: Image.asset(
                              "images/whatsapp.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Image.asset("images/facebook.png"),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Copy link",
                          style: TextStyle(
                            color: Color(0xffF2BC1A),
                            fontSize: 16,
                          ),
                        ),
                        // Text(
                        //   "Instagram",
                        //   style: TextStyle(
                        //     color: Color(0xffF2BC1A),
                        //     fontSize: 16,
                        //   ),
                        // ),
                        Text(
                          "Whatsapp",
                          style: TextStyle(
                            color: Color(0xffF2BC1A),
                            fontSize: 16,
                          ),
                        ),
                        // Text(
                        //   "Facebook",
                        //   style: TextStyle(
                        //     color: Color(0xffF2BC1A),
                        //     fontSize: 16,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
