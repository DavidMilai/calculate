import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;

  void networkOps() async {
    // email = 'mutiemule@solutech.co.ke';
    password = '123456';
    var url = 'https://calculate.co.ke/api/login';
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    print('Response status: ${response.statusCode}');
    print('message${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Solutech',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 54,
                      color: Colors.blue,
                      letterSpacing: 1),
                ),
                Image.asset('images/logo.ico'),
              ],
            ),
            SizedBox(height: 60),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              //validator: validate,
              //controller: controller,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                hintStyle: TextStyle(color: Colors.grey[800]),
                fillColor: Colors.green,
                filled: false,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              obscureText: false,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              //validator: validate,
              //controller: controller,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                hintStyle: TextStyle(color: Colors.grey[800]),
                fillColor: Colors.green,
                filled: false,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              obscureText: false,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 120,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  networkOps();
                },
                color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
