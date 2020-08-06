import 'package:byskopoyako/ui/shared/ui_helpers.dart';
import 'package:byskopoyako/ui/widgets/busy_button.dart';
import 'package:byskopoyako/ui/widgets/text_link.dart';
import 'package:byskopoyako/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LogInView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ViewModelProvider<LogInViewModel>.withConsumer(
      viewModel: LogInViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/logo.jpg'),
              ),
              verticalSpaceLarge,
              Container(
                width: screenSize.width,
                margin:
                    new EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
                height: 60.0,
                decoration: new BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0))),
                child: new TextFormField(
                  controller: emailController,
//                          textType: TextInputType.email,
                  style: new TextStyle(color: Colors.red, fontSize: 18.0),
                  decoration: new InputDecoration(
                    prefixIcon: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Icon(
                        Icons.email,
                        size: 20.0,
                        color: Colors.redAccent,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(12.0),
                    labelText: "Email",
                    labelStyle:
                        new TextStyle(fontSize: 20.0, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: new BorderSide(color: Colors.black54)),
                  ),
                ),
              ),
              verticalSpaceSmall,
              new Container(
                width: screenSize.width,
                margin:
                    new EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
                height: 60.0,
                decoration: new BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0))),
                child: new TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: new TextStyle(color: Colors.red, fontSize: 18.0),
                  decoration: new InputDecoration(
                    prefixIcon: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Icon(
                        Icons.lock,
                        size: 20.0,
                        color: Colors.redAccent,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(12.0),
                    labelText: "Password",
                    labelStyle:
                        new TextStyle(fontSize: 20.0, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: new BorderSide(color: Colors.black54)),
                  ),

//                  Text('Password has to be a minimum of 6 characters.'),
                ),
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BusyButton(
                    title: 'Login',
                    busy: model.busy,
                    onPressed: () {
                      //Perform firebase login here
                      model.logIn(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                ],
              ),
              verticalSpaceMedium,
              TextLink(
                'Create an Account if you\'re new.',
                onPressed: () {
                  model.navigateToSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
