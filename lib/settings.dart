import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String radioButtonItem = 'ONE';
  int id = 1;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Color(0XFF244198),
        drawer: Drawer(
          backgroundColor: Color(0XFF244198),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 170,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0XFF244198),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Center(child: Image.asset("images/logo.png")),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Refer",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Terms & Condition",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset("images/drawer.png"),
            onPressed: () {
              scaffoldkey.currentState?.openDrawer();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.asset("images/notification.png")),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.asset("images/coin.png")),
                ],
              ),
            )
          ],
        ),
        body: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xffF2BC1A), width: 0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Payment",
                          style: TextStyle(
                              color: Color(0xffF2BC1A),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("images/coinpic.png"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("images/rupees.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "5000",
                              style: TextStyle(
                                  color: Color(0xffF2BC1A),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xffF2BC1A), width: 0.5),
                      ),
                      child: Row(children: [
                        Icon(
                          Icons.add,
                          color: Color(0xffF2BC1A),
                        ),
                        Text(
                          "Add Payment",
                          style: TextStyle(
                              color: Color(0xffF2BC1A),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffF2BC1A), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Withdraw Method",
                    style: TextStyle(
                        color: Color(0xffF2BC1A),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Choose a withdraw method to withdraw you won amount.",
                    style: TextStyle(
                      color: Color(0xffF2BC1A),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = '';
                          id = 1;
                        });
                      },
                    ),
                    Container(
                      // width: 30,
                      width: 80,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(15),

                        // image: DecorationImage(
                        //     image: AssetImage("images/method1.png"),
                        //     fit: BoxFit.cover)
                      ),

                      child: Image.asset(
                        "images/paytm.png",
                        // width: 80,
                        // height: 20,
                      ),
                    ),
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'TWO';
                          id = 2;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: 30,
                        decoration: BoxDecoration(

                            // image: DecorationImage(
                            //     image: AssetImage("images/method1.png"),
                            //     fit: BoxFit.cover)
                            ),

                        child: Image.asset(
                          "images/upi.png",
                          width: 80,
                          height: 20,
                        ),
                      ),
                    ),
                    // Image.asset(
                    //   "Images/upi.png",
                    //   width: 20,
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            // width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xffF2BC1A), width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text("Upload Documents",
                      style: TextStyle(
                          color: Color(0xffF2BC1A),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffF2BC1A), width: 0.5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "PAN Card documents",
                                style: TextStyle(
                                  color: Color(0xffF2BC1A),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/doc.png"),
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffF2BC1A), width: 0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Address proof documents",
                              style: TextStyle(
                                color: Color(0xffF2BC1A),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("images/doc.png"),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ]));
  }
}
