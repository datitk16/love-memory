import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:love_memory/constants.dart';
import 'package:love_memory/screens/sign_up/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/dialogs.dart';
import '../../service/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  late TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String email;

  void initState() {
    super.initState();
    getEmail();
  }

  setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', 'test@gmail.com');
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController = TextEditingController(text: prefs.getString('username'));
    print(emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, bottom: 70),
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 3),
                child: Text(
                  'Chat app for love',
                  style: TextStyle(
                      fontFamily: 'Lobster', color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 22, bottom: 20),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black87,
                            fontFamily: 'Lobster',
                            decoration: TextDecoration.none),
                      )),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.purpleAccent, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FaIcon(FontAwesomeIcons.envelope),
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: emailController,
                                  autofillHints: [AutofillHints.email],
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    label: Text(" E-mail ..."),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.purpleAccent, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FaIcon(FontAwesomeIcons.key),
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: passwordController,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    label: Text("Password ..."),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 50),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.purpleAccent,
                                        shadowColor: Colors.purpleAccent,
                                        elevation: 18,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    onPressed: () {
                                      setEmail();
                                      context
                                          .read<AuthenticationService>()
                                          .signIn(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          );
                                    },
                                    // onPressed: () async {
                                    //   await overlay.during(Future.delayed(
                                    //       const Duration(seconds: 20)));
                                    // },
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: LinearGradient(colors: [
                                            Colors.purpleAccent,
                                            Colors.deepPurpleAccent
                                          ])),
                                      width: 200,
                                      height: 50,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                _forgotPassword(),
                                _switchToSignupPage()
                              ],
                            ))
                      ],
                    ),
                  )
                ]),
              ),
            ))
            // Expanded()
          ],
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return Center(
      child: Text(
        'Forgot password?',
        style: TextStyle(fontSize: 16.0, color: Colors.deepPurpleAccent),
      ),
    );
  }

  Widget _switchToSignupPage() {
    return Padding(
        padding: EdgeInsets.only(top: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontStyle: FontStyle.italic,
                  fontSize: 17.0),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignUp()));
              },
            )
          ],
        ));
  }
}
