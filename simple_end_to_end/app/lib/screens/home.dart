import 'package:flutter/material.dart';
import '../models/something.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RaisedButton(
                  child: Text("Fetch Data"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: handleFetchTap),
              RaisedButton(child: Text("Reset"), onPressed: handleResetTap),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(message, style: TextStyle(fontSize: 26.0)),
            ]),
          ])),
    );
  }

  handleFetchTap() async {
    var someData = await Something.fetch();

    setState(() {
      message = someData;
    });
  }

  handleResetTap() async {
    setState(() {
      message = "";
    });
  }
}
