import 'package:flutter/material.dart';
import 'package:math_puzzle/2gameleval.dart';
import 'package:math_puzzle/levallist.dart';
import 'package:math_puzzle/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class win extends StatefulWidget {
  int cur_level;
   win(this.cur_level);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  String ff = "f1";
  int cur_level = 0;
  SharedPreferences ? prefs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    final prefs = await SharedPreferences.getInstance();
    cur_level = prefs!.getInt("curlevel")?? 0;
  }
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
                  height: 100,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "PUZZLE ${widget.cur_level} COMPLETED",
                    style: TextStyle(
                        fontFamily: ff,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),

            Container(
              height: 150,
              width: 200,
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/trophy.png"))),
            ),
            InkWell(onTap: () {
              if(widget.cur_level<widget.cur_level-1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return leval(cur_level);
                  },));
                }
              else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return leval(cur_level);
                  },));
                }

            },
              child: Container(
                height: 30,
                width: 120,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "CONTINUE",
                  style: TextStyle(
                      fontSize: 15, fontFamily: ff, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return math();
              },));
            },
              child: Container(
                height: 30,
                width: 120,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "MAIN MANU",
                  style: TextStyle(
                      fontSize: 15, fontFamily: ff, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "BUY PRO",
                style: TextStyle(
                    fontSize: 15, fontFamily: ff, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "SHARE THIS PUZZLE",
                style: TextStyle(
                    fontFamily: ff,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/shareus.png"),
                ),
                color: Colors.grey,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
