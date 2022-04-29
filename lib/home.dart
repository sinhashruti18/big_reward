import 'package:big_reward/Homepage.dart';
import 'package:big_reward/notification.dart';
import 'package:big_reward/profile.dart';
import 'package:big_reward/rank.dart';
import 'package:big_reward/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    HomeScreen(),
    NotificationPage(),
    RankPage(),
    ProfilePage(),
    SettingsPage(),
  ];
  int currentIndex = 0;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      key: scaffoldkey,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xffF2BC1A),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: ("Notification")),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/rank.png")),
                label: ("Rank")),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/user.png")),
                label: ("Profile")),
          ]),
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
    );
  }
}
