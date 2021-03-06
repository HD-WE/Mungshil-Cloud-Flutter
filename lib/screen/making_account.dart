import 'package:flutter/material.dart';

import 'input_main_page.dart';
import 'package:mongsil/apis/post_email_password.dart';

class MakingAccount extends StatefulWidget {
  @override
  _MakingAccount createState() => _MakingAccount();
}

class _MakingAccount extends State<MakingAccount> {
  final emailText = TextEditingController();
  final password = TextEditingController();

  emailSendFunction() {
    postRequest(emailText.text, password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Row(
              children: <Widget>[
                Text(
                  '계정을 만들어 주세요!',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '''
                  안녕하세요.
                  계정을 생성해주세요!
                  ''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이메일 주소',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '비밀번호',
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 40,
                  child: FlatButton(
                    child: Text(
                      '다음',
                      style: TextStyle(fontSize: 24),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    //onPressed: EmailSendFunction(), 
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputMainPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
