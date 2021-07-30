import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:async';
//import 'package:flutter_widget_guide/utils.dart';

import 'package:flutter_radio/flutter_radio.dart';

void main() {
  runApp(MaterialApp(title: 'Akure Radio', home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const streamUrl =
      "http://streamserver.1box.network/radio/8050/radio.mp3?1589490078";

 bool isPlaying = false;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Akure Radio'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: ExactAssetImage("Images/img4.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Schedule"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => about_akure()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About radio"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Akure city"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => schedule()));
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Rate this app"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              constraints: (BoxConstraints.expand(height: 270.0)),
              child: (Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Image(
                    height: 250,
                    fit: BoxFit.fill,
                    image: AssetImage("Images/img4.jpg"),
                  )))),
          Container(
              height: 250,
              child: (Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Carousel(
                  boxFit: BoxFit.fill,
                  images: [
                    AssetImage('Images/img1.jpg'),
                    AssetImage('Images/img2.jpg'),
                    AssetImage('Images/img3.jpg'),
                    AssetImage('Images/img4.jpg'),
                  ],
                  autoplay: true,
                  indicatorBgPadding: 1.0,
                  dotBgColor: Colors.greenAccent,
                ),
              ))),
          Container(
            child:  IconButton(icon: isPlaying? Icon(
                          Icons.pause_circle_outline,
                          size: 80,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.play_circle_outline,
                          color: Colors.green,
                          size: 80,
                        ),
                            onPressed: (){
                          setState(() {
                            FlutterRadio.play(url: streamUrl);
                            isPlaying = !isPlaying;
                            isVisible = !isVisible;
                          });
                            },
            ),
          ),
        ],
      ),
    );
  }
}

class about_akure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
           
            backgroundColor: Colors.green,

            
            floating: false,

            pinned: true,
            expandedHeight: 200.0,

            
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('Images/img1.jpg'),
              ),
              centerTitle: true,
              title: Text(
                "About Akure",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.code),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// ignore: camel_case_types

class schedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return scheduleState();
  }
}

class scheduleState extends State<schedule> {
  Widget listItem(String title, BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).backgroundColor,
              width: 1.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      ///Scroll view for Sliver app bar for giving custom scroll behaviour
      body: CustomScrollView(
        slivers: <Widget>[
          ///First sliver is the App Bar
          SliverAppBar(
           
            backgroundColor: Colors.green,

            floating: false,

            
            pinned: true,
            expandedHeight: 200.0,

        
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('Images/img1.jpg'),
              ),
              centerTitle: true,
              title: Text(
                "Program Schedule",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.code),
              )
            ],
          ),

          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              [
                listItem("Mondays", context),
                listItem("Tuesdays", context),
                listItem("Wednesday", context),
                listItem("Thursday", context),
                listItem("Fridays", context),
                listItem("Saturdays", context),
                listItem("Sundays", context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 5), () => MyApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white10),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
