import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'filter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: Center(
                child: Text(
              'Food detective',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            backgroundColor: Colors.green,
          )),
      body: Container(
          padding: EdgeInsets.only(top: 50),
          margin: EdgeInsets.fromLTRB(30, 50, 30, 100),
          color: Colors.blueGrey.withOpacity(0.3),
          child: Center(
              child: Container(
                  child: Column(children: <Widget>[
            Image(
              image: AssetImage('asset/images/magnifier.png'),
              height: 80,
              width: 80,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Hello, I am a food detective. Within a few steps, I can help you identify foods you are allergic to. Let\'s start! ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.green,
              textColor: Colors.black,
              child: Text('Start'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Filter()),
                );
              },
            ),
          ])))),
    );
  }
}
