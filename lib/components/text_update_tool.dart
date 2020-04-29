import 'package:flutter/material.dart';

class TextUpdate extends StatefulWidget {
  final String original = "";

  @override
  _TextUpdateState createState() => _TextUpdateState();
}

class _TextUpdateState extends State<TextUpdate> {
  String original;
  final _controller = TextEditingController();

  void initState() {
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
          height: 150,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  key: GlobalKey<FormState>(),
                  controller: _controller,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(15.0)),
                ),
                MaterialButton(
                  onPressed: () async {
                    print("edit page"+_controller.text);
                    Navigator.pop(context, _controller.text);
                  },
                  minWidth: 150,
                  color: Colors.grey,
                  splashColor: Colors.lightBlueAccent[800],
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Confirm Change",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ]),
        ));
  }
}
