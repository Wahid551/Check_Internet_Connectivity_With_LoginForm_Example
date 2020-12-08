import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Connectivity Method
  String data = 'Data Entered';
  String check = '';
  void checkcon() async {
    var conresult = await (Connectivity().checkConnectivity());
    if (conresult == ConnectivityResult.none) {
      setState(() {
        check = '';
      });
      Fluttertoast.showToast(
          msg: "No Internet Connection",
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        check = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[900],
              Colors.orange[500],
              Colors.orange[400]
            ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    padding: EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        TextField(
                          // onChanged: (text) {
                          //   value = text;
                          // },
                          keyboardType: TextInputType.name,
                          autofocus: true,
                          decoration: InputDecoration(
                            //helperText: 'user name',
                            labelText: 'username',
                            prefixIcon: Icon(
                              FontAwesomeIcons.user,
                              size: 20.0,
                              color: Colors.deepOrangeAccent,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          // onChanged: (text) {
                          //   nmbr = text;
                          // },

                          keyboardType: TextInputType.number,
                          autofocus: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            //helperText: 'user name',
                            labelText: 'Enter Password',
                            prefixIcon: Icon(
                              FontAwesomeIcons.userSecret,
                              size: 20.0,
                              color: Colors.deepOrangeAccent,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Container(
                              width: 250.0,
                              child: RaisedButton(
                                onPressed: () {
                                  checkcon();
                                },
                                color: Colors.deepOrangeAccent,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Text(check.toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
