import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class forgotpage extends StatefulWidget {
  const forgotpage({super.key});

  @override
  State<forgotpage> createState() => _forgotpageState();
}

class _forgotpageState extends State<forgotpage> {
  TextEditingController emailControlle = TextEditingController();

  // Future<void> changePassword(String newPassword) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   print(newPassword);
  //   _token = sharedPreferences.getString("token");
  //   final url =
  //       'https://identitytoolkit.googleapis.com/v1/accounts:update?key='';
  //   try {
  //     await http.post(
  //       url,
  //       body: json.encode(
  //         {
  //           'idToken': _token,
  //           'password': newPassword,
  //           'returnSecureToken': true,
  //         },
  //       ),
  //     );
  //   } catch (error) {
  //     throw error;
  //   }
  // }
  @override
  void dispose() {
    emailControlle.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailControlle.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Reset Password"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text(
            "Enter valid email",
            style: TextStyle(fontSize: 20, color: Colors.orange),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            controller: emailControlle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffe46b10)),
                child: const Text('Reset Password'),
                onPressed: () {
                  resetPassword();
                })),
      ]),
    );
  }
}
