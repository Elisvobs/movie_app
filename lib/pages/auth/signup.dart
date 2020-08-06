import 'package:byskopoyako/tools/app_data.dart';
import 'package:byskopoyako/tools/app_methods.dart';
import 'package:byskopoyako/tools/app_tools.dart';
import 'package:byskopoyako/tools/firebase_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController retypePassword = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethod = new FirebaseMethods();
  BuildContext context;

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
            "Sign Up",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
//      resizeToAvoidBottomPadding: false,
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(5.0),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new SizedBox(
                    height: 10.0,
                  ),
                  new Container(
                    height: 50.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 2.5,
                        ),
                        height: 50.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(20.0),
                          ),
                        ),
                        child: new TextFormField(
                          controller: fullName,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Icon(
                                Icons.person,
                                size: 20.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: "Username",
                            labelStyle: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: new BorderSide(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 5.0,
                  ),
                  new Container(
                    height: 50.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 2.5,
                        ),
                        height: 50.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(20.0),
                          ),
                        ),
                        child: new TextFormField(
                          controller: phoneNumber,
                          keyboardType: TextInputType.phone,
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Icon(
                                Icons.phone_iphone,
                                size: 20.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: "Mobile Number",
                            labelStyle: new TextStyle(
                              fontSize: 18.0,
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
                    height: 5.0,
                  ),
                  new Container(
                    height: 50.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 2.5,
                        ),
                        height: 50.0,
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
                            fontSize: 16.0,
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
                              fontSize: 18.0,
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
                    height: 5.0,
                  ),
                  new Container(
                    height: 50.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 2.5,
                        ),
                        height: 50.0,
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
                            fontSize: 16.0,
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
                              fontSize: 18.0,
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
                    height: 5.0,
                  ),
                  new Container(
                    height: 50.0,
                    margin: new EdgeInsets.only(top: 5.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                        width: screenSize.width,
                        margin: new EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 2.5,
                        ),
                        height: 50.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            new Radius.circular(20.0),
                          ),
                        ),
                        child: new TextFormField(
                          controller: retypePassword,
                          obscureText: true,
                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          decoration: new InputDecoration(
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new Icon(
                                Icons.lock,
                                size: 20.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: "Confirm Password",
                            labelStyle: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: new BorderSide(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: 5.0,
                  ),
                  new InkWell(
                    onTap: verifyDetails,
                    child: new Container(
                      height: 50.0,
                      margin: new EdgeInsets.only(top: 5.0),
                      child: new Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Container(
                          width: screenSize.width,
                          margin: new EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 2.5,
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
                            "Create Account",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (fullName.text == "") {
      showSnackBar("Full name cannot be empty!", scaffoldKey);
      return;
    }

    if (phoneNumber.text == "") {
      showSnackBar("Phone number cannot be empty!", scaffoldKey);
      return;
    }

    if (email.text == "") {
      showSnackBar("Email cannot be empty!", scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar("Password cannot be empty!", scaffoldKey);
      return;
    }

    if (retypePassword.text == "") {
      showSnackBar("Retype Password cannot be empty!", scaffoldKey);
      return;
    }

    if (password.text != retypePassword.text) {
      showSnackBar("Password don't match! Try again!", scaffoldKey);
    }

    displayProgressDialog(context);

    String response = await appMethod.createUserAccount(
        fullName: fullName.text.toLowerCase(),
        phone: phoneNumber.text,
        email: email.text.toLowerCase(),
        password: password.text);
    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
