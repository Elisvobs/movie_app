import 'package:byskopoyako/pages/home/home_page.dart';
import 'package:byskopoyako/tools/app_data.dart';
import 'package:byskopoyako/tools/app_methods.dart';
import 'package:byskopoyako/tools/app_tools.dart';
import 'package:byskopoyako/tools/firebase_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethod = new FirebaseMethods();
  BuildContext context;
  bool isLoading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    this.setState(() {
      isLoading = true;
    });

    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }

    this.setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new GestureDetector(
          onLongPress: () {},
          child: new Text(
            "Login",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 5.0,
                right: 5.0,
              ),
              height: 120.0,
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      height: 100.0,
                      width: 100.0,
                      child: new Image.asset(
                        'assets/images/logo.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.grey,
                borderRadius: new BorderRadius.only(
                  bottomLeft: new Radius.circular(20.0),
                  bottomRight: new Radius.circular(20.0),
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(20.0),
                  topRight: new Radius.circular(20.0),
                ),
              ),
              constraints: const BoxConstraints(maxHeight: 400.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    height: 60.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 10.0,
                        ),
                        height: 60.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(20.0),
                          ),
                        ),
                        child: new TextFormField(
                          controller: email,
//                          textType: TextInputType.email,
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Icon(
                                Icons.email,
                                size: 20.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(15.0),
                            labelText: "Email",
                            labelStyle: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: new BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 15.0,
                  ),
                  new Container(
                    height: 60.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 10.0,
                        ),
                        height: 60.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(20.0),
                          ),
                        ),
                        child: new TextFormField(
                          controller: password,
                          obscureText: true,
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Icon(
                                Icons.lock,
                                size: 20.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(15.0),
                            labelText: "Password",
                            labelStyle: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: new BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 15.0,
                  ),
                  new InkWell(
                    onTap: verifyLogin,
                    child: new Container(
                      height: 60.0,
                      margin: new EdgeInsets.only(top: 5.0),
                      child: new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(
                          width: screenSize.width,
                          margin: new EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 5.0,
                          ),
                          height: 50.0,
                          decoration: new BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: new BorderRadius.all(
                              new Radius.circular(20.0),
                            ),
                          ),
                          child: new Center(
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
//                  appButton(
//                    btnText: "Login",
//                    onBtnClicked: verifyLogin,
//                    btnPadding: 15.0,
//                    btnColor: Colors.white,
//                  ),
                  new SizedBox(
                    height: 15.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 20.0,
                    ),
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          new CupertinoPageRoute(
                            builder: (BuildContext context) => new SignUp(),
                          ),
                        );
                      },
                      child: new Text(
                        "Not Registered? Sign Up Here!",
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  verifyLogin() async {
    if (email.text == "") {
      showSnackBar("Email cannot be empty!", scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar("Password cannot be empty!", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
//    try {
//      String response = await appMethod.loginUser(
//          email: email.text.toLowerCase(), password: password.text);
//    } on PlatformException catch(e) {
//      print(e.details);
//      return e.details;
//    }
    String response = await appMethod.loginUser(
        email: email.text.toLowerCase(), password: password.text);
    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
      showSnackBar("Login successful", scaffoldKey);
    } else {
      closeProgressDialog(context);
//      showSnackBar(errorMSG, scaffoldKey);
    }
  }
}
