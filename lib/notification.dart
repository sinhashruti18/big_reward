import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class Notification {
  var image = "";
  var notification = "";

  Notification(this.image, this.notification);
}

List NotificationList = <Notification>[
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
  Notification("images/coinpic.png", "You won 20 refer coins"),
];

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF244198),
      body: MyListView(),
    );
  }

  Widget MyListView() {
    var listview = ListView.builder(
        itemCount: NotificationList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffF2BC1A), width: 0.5),
                ),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    NotificationList[index].notification,
                    style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
                  ),
                  leading: Image(
                    image: AssetImage(NotificationList[index].image),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        });
    return listview;
  }
}
