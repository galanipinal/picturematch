import 'package:flutter/material.dart';
import 'package:picturematch/game_leval.dart';
import 'package:picturematch/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Leval_Page extends StatefulWidget {
  Leval_Page();
  @override
  State<Leval_Page> createState() => _Leval_PageState();
}

class _Leval_PageState extends State<Leval_Page> {
  int cur_lvl = 0, time = 0;

  // List list =[];
  List time_list = [];
  List win_list = [];
  bool temp = false;
  bool win_temp = false;
  List levalstatus = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cur_lvl = DashBoard.prefs!.getInt("levelNo") ?? 0;
    print("levelNo:$cur_lvl");
    levalstatus = List.filled(100, "no");
    time_list = List.filled(100, "");

    for (int i = 0; i < 60; i++) {
      levalstatus[i] = DashBoard.prefs!.getString("levelstatus$i") ?? "No";
    }

    for (int i = 0; i < 100; i++) {
      time_list[i] = DashBoard.prefs!.getInt("time$i") ?? 0;
    }
    temp = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              "SELECT LEVAL       NO TIME LIMIT",
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.volume_up),
                onPressed: () => Icon(Icons.volume_off_sharp),
              ),
              IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => Icon(Icons.volume_off_sharp)),
            ],
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/background1.jpg"),
                    fit: BoxFit.cover)),
            child: (temp == true)
                ? ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, Myind) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide())),
                                    //color: Colors.tealAccent,
                                    child: Text(
                                      "${"MATCH ${(Myind)}"}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.question_mark_sharp,
                                      size: 20,
                                      color: Colors.teal,
                                    ),
                                    height: 30,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 2, color: Colors.teal),
                                      //color: Colors.teal
                                    ),
                                    // color: Colors.limeAccent,
                                  )
                                ],
                              ),
                              Container(
                                height: 350,
                                width: 150,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          if ((Myind * 10) + index <= cur_lvl) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    color: Colors.teal,
                                                    child: Text(
                                                      "TIME: NO TIME LIMIT",
                                                      // textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  content: Text(
                                                    "YOU HAVE 5 SECONDS TO MEMORIES ALL IMAGES",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                            builder: (context) {
                                                              return Game_Leval(
                                                                  (Myind * 10) +
                                                                      index);
                                                            },
                                                          ));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 30,
                                                              width: 60,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .teal,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .white)),
                                                              child: Text(
                                                                "GO",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                );
                                              },
                                            );

                                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            //   return Game_Leval(widget.cur_ind);
                                            // },));
                                          }
                                        },
                                        child:Container(
                                            alignment: Alignment.center,
                                            child: (levalstatus[(Myind*10)+index]=="win")?Text(
                                              "LEVEL ${(Myind * 10) + index + 1}-${time_list[index]}s ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ):Text(
                                              "LEVEL ${(Myind * 10) + index + 1} ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            margin: EdgeInsets.all(5),
                                            height: 25,
                                            width: 150,
                                            color: (levalstatus[
                                            (Myind * 10) + index] ==
                                                "win")
                                                ? Colors.teal
                                                : Colors.grey));
                                  },
                                ),
                              )
                            ]),
                            height: 400,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.teal),
                              //color: Colors.tealAccent,
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : CircularProgressIndicator(),
          )),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure for exit..."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DashBoard();
                        },
                      ));
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("NO"))
              ],
            );
          },
        );

        return true;
      },
    );
  }
}
