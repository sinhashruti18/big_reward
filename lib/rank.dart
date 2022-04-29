import 'package:flutter/material.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  State<RankPage> createState() => _RankPageState();
}

class GlobalRank {
  var sno = "";
  var name = "";
  var image = "";
  var coins = "";
  GlobalRank(this.sno, this.name, this.image, this.coins);
}

List GlobalRankList = <GlobalRank>[
  GlobalRank("1", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("2", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("3", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("4", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("5", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("6", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("7", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("8", "Harsh", "images/coinpic.png", "200"),
  GlobalRank("9", "Harsh", "images/coinpic.png", "200"),
];

class _RankPageState extends State<RankPage> {
  // void condition() {
  //   if (rankig == "Weekly") {
  //     WeeklyListView();
  //   }
  //   if (rankig == "Monthly") {
  //     MonthlyListView();
  //   }
  //   if (rankig == "Global") {
  //     MyListView();
  //   }
  // }

  String rankig = "Weekly";
  List Rankig = ["Weekly", "Global", "Monthly"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF244198),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                padding: EdgeInsets.symmetric(horizontal: 0),
                width: 200,
                height: 60,
                // margin: EdgeInsets.only(top: 190),

                decoration: BoxDecoration(
                  color: Color(0XFF244198),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffF2BC1A), width: 1.5),
                ),
                child: FormField(builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0XFF8D54CE)),
                            borderRadius: BorderRadius.circular(10.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text(""),
                        dropdownColor: Color(0XFF244198),
                        elevation: 5,
                        isDense: false,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: rankig,
                        onChanged: (String? newvalue) {
                          setState(() {
                            rankig = newvalue!;
                          });
                        },
                        items: Rankig.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: TextStyle(color: Color(0xffF2BC1A)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              MyListView2()
            ],
          ),
        ));
  }

  Widget MyListView2() {
    var listview = ListView.builder(
        shrinkWrap: true,
        itemCount: GlobalRankList.length,
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
                    GlobalRankList[index].name,
                    style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
                  ),
                  leading: Text(
                    GlobalRankList[index].sno,
                    style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      Image(image: AssetImage(GlobalRankList[index].image)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        GlobalRankList[index].coins,
                        style:
                            TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
                      ),
                    ],
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

  // Widget WeeklyListView() {
  //   var listview2 = ListView.builder(
  //       itemCount: GlobalRankList.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Column(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 border: Border.all(color: Color(0xffF2BC1A), width: 0.5),
  //               ),
  //               child: ListTile(
  //                 onTap: () {},
  //                 title: Text(
  //                   GlobalRankList[index].name,
  //                   style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
  //                 ),
  //                 leading: Text(
  //                   GlobalRankList[index].sno,
  //                   style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
  //                 ),
  //                 trailing: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Image(image: AssetImage(GlobalRankList[index].image)),
  //                       Text(
  //                         GlobalRankList[index].coins,
  //                         style:
  //                             TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
  //                       ),
  //                     ]),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             )
  //           ],
  //         );
  //       });
  //   return listview2;
  // }

  // Widget MonthlyListView() {
  //   var listview3 = ListView.builder(
  //       itemCount: GlobalRankList.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Column(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 border: Border.all(color: Color(0xffF2BC1A), width: 0.5),
  //               ),
  //               child: ListTile(
  //                 onTap: () {},
  //                 title: Text(
  //                   GlobalRankList[index].name,
  //                   style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
  //                 ),
  //                 leading: Text(
  //                   GlobalRankList[index].name,
  //                   style: TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
  //                 ),
  //                 trailing: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Image(image: AssetImage(GlobalRankList[index].image)),
  //                       Text(
  //                         GlobalRankList[index].coins,
  //                         style:
  //                             TextStyle(color: Color(0xffF2BC1A), fontSize: 20),
  //                       ),
  //                     ]),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             )
  //           ],
  //         );
  //       });
  //   return listview3;
}
