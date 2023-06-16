import 'package:flutter/material.dart';
import 'package:math_puzzle/levallist.dart';

class four extends StatefulWidget {
  List puzzle_status;
  int cur_level;

four(this.puzzle_status,this.cur_level);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  String ff = "f1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.cover)),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Select Puzzle",
                    style: TextStyle(
                        fontFamily: ff,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: (index < widget.cur_level)
                        ? Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 25),
                    )
                        : null,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: (index < widget.cur_level)
                          ? (widget.puzzle_status[index] == "win")
                          ? DecorationImage(
                          image: AssetImage("image/tick.png"))
                          : null
                          : DecorationImage(
                          image: AssetImage("image/lock.png")),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              InkWell(onTap: () {

              },
                child: Container(height: 35,
                  width: 35,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/next.png")))
                  ,),
              )
            ],)
          ],
        ),
      ),
    );
  }
}
