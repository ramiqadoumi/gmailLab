
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finaltest2/ltucapp/AdminPage.dart';
import 'package:finaltest2/ltucapp/forgotpage.dart';
import 'package:finaltest2/ltucapp/signup_Screen.dart';
import 'package:finaltest2/ltucapp/userpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../testapp/googlisignin.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final CollectionReference products =
      FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot> provideDocumentFieldStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc('email')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: Text("Login page"),),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: _title()),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xffe46b10),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
              // Container(
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(image: AssetImage("images/1.png"))),
              // ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return forgotpage();
                      },
                    ));
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color(0xffe46b10), fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffe46b10)),
                      child: const Text('Login'),
                      onPressed: () async {
                        if (nameController.text.startsWith("admin")) {
                          try {
                            var auth = FirebaseAuth.instance;
                            UserCredential myUser =
                                await auth.signInWithEmailAndPassword(
                                    email: nameController.text,
                                    password: passwordController.text);
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const AdminPage();
                              },
                            ));
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${e.message}')));
                          }
                        } else {
                          try {
                            var auth = FirebaseAuth.instance;
                            UserCredential myUser =
                                await auth.signInWithEmailAndPassword(
                                    email: nameController.text,
                                    password: passwordController.text);
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const userpage();
                              },
                            ));
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${e.message}')));
                          }
                        }
                      })),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              TextButton(
                  onPressed: () {
                     final provider= Provider.of<GoogleSigninProvider>(context,listen: false);
            provider.googleLogin();
                  },
                  child: Text(
                    "Sign in with gmail",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
    );
  }
}

Widget _title() {
  return RichText(
    softWrap: false,
    text: TextSpan(
        onEnter: ((event) {
          print("123");
        }),
        text: 'Lt',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
        children: [
          TextSpan(
            text: 'uc Stu',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'dents',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}
