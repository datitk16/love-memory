import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple.shade600, Colors.deepOrangeAccent])),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, bottom: 70),
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3),
                child: Text('Memory love'),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
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
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purpleAccent,
                                    blurRadius: 10,
                                    offset: Offset(1, 1))
                              ],
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
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purpleAccent,
                                    blurRadius: 10,
                                    offset: Offset(1, 1))
                              ],
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
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.purpleAccent,
                                    shadowColor: Colors.purpleAccent,
                                    elevation: 18,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {},
                                child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
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
                                )))
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
}
