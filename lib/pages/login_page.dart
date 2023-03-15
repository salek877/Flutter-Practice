import 'package:assignmenta/pages/bottom_navigation_bar.dart';
import 'package:assignmenta/pages/dash_board_screen.dart';
import 'package:assignmenta/services/form_validation.dart';
import 'package:assignmenta/services/page_navigate_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: _formKey,
            child: Container(
              height: _height,
              width: _width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "TextField is empty";
                                } else if (value.length < 6) {
                                  return "TextField must be more than 5 character";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is empty";
                                } else if (value.length < 9) {
                                  return "Password must be more than 8 character";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[400],
                                    fixedSize: Size(300, 55),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {
                                  if (validateAndSave(_formKey)) {
                                    print("Logged In");
                                    navigateToNextScreen(
                                        context, BottomNavigatonBar());
                                  } else {
                                    print("Not Logged In");
                                  }
                                },
                                child: Text('Login')),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    fixedSize: Size(300, 55),
                                    side: BorderSide(
                                        color: Colors.blue,
                                        style: BorderStyle.solid,
                                        width: 2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {},
                                child: Text(
                                  'Facebook',
                                  style: TextStyle(color: Colors.blue),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    fixedSize: Size(300, 55),
                                    side: BorderSide(
                                        color: Colors.red,
                                        style: BorderStyle.solid,
                                        width: 2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () {},
                                child: Text(
                                  'Google',
                                  style: TextStyle(color: Colors.red),
                                )),
                            SizedBox(
                              height: 32,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot Password?')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
