import 'package:flutter/material.dart';
import 'package:picturematch/leval_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: DashBoard(),
    debugShowCheckedModeBanner: false,
  ));
}

class DashBoard extends StatefulWidget {

  const DashBoard({Key? key}) : super(key: key);
  static SharedPreferences?prefs;
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int cur_ind=0;

  get() async {
   DashBoard. prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Select mode"),actions: [
        IconButton(icon: Icon(Icons.volume_down),
            onPressed: ()=> Icon(Icons.volume_off_sharp)),
        IconButton(icon: Icon(Icons.more_vert),
            onPressed: ()=> Icon(Icons.volume_off_sharp)),
      ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image:
        DecorationImage(image: AssetImage("image/background1.jpg"),fit: BoxFit.cover),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 220,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white,
                      border: Border.all(color: Colors.teal,width: 5),
                      //color: Colors.teal,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Leval_Page();
                        },));
                      },
                        child: Container(
                          height: 40,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.teal),
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(2)),
                          child: Text(
                            "NO TIME LIMIT",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal,width: 4),
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          "NORMAL",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal),
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          "HARDs",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              width: 140,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white,
                  border: Border.all(color: Colors.teal,width: 4),
                  //color: Colors.teal,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "Remove ads",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),

                ],
              ),

            ),
            Container(
              height: 70,
              width: 240,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white,
                  border: Border.all(color: Colors.teal,width: 4),
                  //color: Colors.teal,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "SHARE",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "MORE GAMES",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
