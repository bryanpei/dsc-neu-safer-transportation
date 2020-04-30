import 'package:flutter/material.dart';
import 'package:safer_transportation/services/data/UserInfo.dart';

class EditInfo extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context).settings.arguments;
    String field = data['field'];
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        backgroundColor: Colors.white,
        title: Text(
              field,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
        )
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 30.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                hintText: 'enter here'
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                switch (field) {
                  case 'First Name':
                    UserInfo.firstName = _controller.text;
                    break;
                  case 'Last Name':
                    UserInfo.lastName = _controller.text;
                    break;
                  case 'Email':
                    UserInfo.email = _controller.text;
                    break;
                  case 'Password':
                    UserInfo.password = _controller.text;
                    break;
                  case 'Phone':
                    UserInfo.phone = _controller.text;
                    break;
                }
                print(UserInfo.firstName);
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            ),
          )
        ],
      ),
    );
  }

}