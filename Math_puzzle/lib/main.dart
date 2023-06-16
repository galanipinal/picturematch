import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle/2gameleval.dart';
import 'package:math_puzzle/levallist.dart';
import 'package:math_puzzle/puzzlethird.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: math(), debugShowCheckedModeBanner: false));
}

class math extends StatefulWidget {
  const math({Key? key}) : super(key: key);

  @override
  State<math> createState() => _mathState();
}

class _mathState extends State<math> {
  bool temp = false;
  bool temp1 = false;
  bool temp2 = false;
  String ff = "f1";
  int cur_level = 0;
  List puzzle_status = [];
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    puzzle_status = List.filled(data.ans.length, "no");
    get();
  }

  get() async {
     prefs = await SharedPreferences.getInstance();
    cur_level = prefs!.getInt("curlevel") ?? 0;

    for (int i = 0; i < cur_level; i++) {
      puzzle_status[i] = prefs!.getString("leval$i");
    }
    print(puzzle_status);
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        height: 100,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Math puzzle",
                          style: TextStyle(
                            fontFamily: ff,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 350,
              width: 400,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/1_background.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTapUp: (details) {
                      temp = false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return leval(cur_level);
                        },
                      ));
                      setState(() {});
                      print("onTapUp");
                    },
                    onTapDown: (details) {
                      temp = true;
                      print("ontapdown");
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp = false;
                      print("ontapcncel");
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: (temp)
                              ? Border.all(width: 3, color: Colors.white)
                              : null),
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: ff,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapUp: (details) {
                      temp1 = false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return third(puzzle_status, cur_level);
                        },
                      ));
                      print("onTapup");
                      setState(() {});
                    },
                    onTapDown: (details) {
                      temp1 = true;

                      print("onTapDown");
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp1 = true;
                      print("onTapcancle");
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: (temp1)
                              ? Border.all(width: 3, color: Colors.white)
                              : null),
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      child: Text(
                        "PUZZLES",
                        style: TextStyle(
                            color: Colors.white, fontFamily: ff, fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapUp: (details) {
                      temp2 = false;
                      print("onTapup");
                      setState(() {});
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              """Benefits of pro version......"""
                              """1.No Ads """
                              """2. No WAit time for hint and skip"""
                              """3. Hint for every level"""
                              """4. Solution for every level""",
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "BUY",
                                    style: TextStyle(
                                        color: Colors.black,
                                        ),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "No,THANKS",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    onTapDown: (details) {
                      temp2 = true;
                      print("onTapDown");
                      setState(() {});
                    },
                    onTapCancel: () {
                      temp2 = true;
                      print("onTapcancle");
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: (temp2)
                              ? Border.all(width: 3, color: Colors.white)
                              : null),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: 150,
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(
                            color: Colors.white, fontFamily: ff, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("image/shareus.png"),
                      ),
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/emailus.png")),
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(40, 0, 10, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      "Privacy Policy",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
