import 'package:allergic_ingredients_detector/CameraPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FilterState();
}

class FilterState extends State<Filter> {
  TextEditingController _controller;
  String element;
  bool _inputValid = true;
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_addLatestValue);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  _addLatestValue() {
    setState(() {
      element = _controller.text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
          child: Center(
              child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(width: 10),
                  Text(
                    'What are you allergic to?',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              TextField(
                controller: _controller,
                onChanged: (String value) {
                  setState(() {
                    element = _controller.text;
                    print(element);
                  });
                },
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(width: 10),
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              CameraPage(category: element),
            ],
          )),
        ));
  }
}
