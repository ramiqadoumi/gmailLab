// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController adminoruserController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('users');

 
void register(String email, String password, String username,
      BuildContext context) async {
    try {
                var auth = FirebaseAuth.instance;

      
      UserCredential userCred = await auth
          .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("added successfully")));

      await userCred.user!.updateDisplayName(usernameController.text);

     
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCred.user!.uid)
          .set(
        {
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      
     
    } catch (e) {
      
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e"))) ;   }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  // Widget _entryField(String title, {bool isPassword = false}) {
  Widget _TextField(String title, TextEditingController myController,
      {bool isPassword = false}) {
    return Container(
      child: Column(
        children: [
          Container(alignment: Alignment.centerLeft, child: Text(" $title")),
          TextField(
              controller: myController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        
        padding: EdgeInsets.all(20)
      ),
      onPressed: ()  {
       register(emailController.text, passwordController.text, usernameController.text, context);
      },
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login_screen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      children: [
        // Container(
        //   height: 100,
        //   width: 100,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(image: AssetImage("images/1.png"))),
        // ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
            appBar: AppBar(backgroundColor: Colors.orange,title: Text("Sign up page"),),

      body: Container(
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: _backButton(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _TextField(
                        "Username", isPassword: false, usernameController),
                    _TextField("Email", isPassword: false, emailController),
                    _TextField(
                        "Password", isPassword: true, passwordController),
                                            SizedBox(height:20),

                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
