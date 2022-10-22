// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class withGmail extends StatefulWidget {
//   const withGmail({super.key});

//   @override
//   State<withGmail> createState() => _withGmailState();
// }

// class _withGmailState extends State<withGmail> {
//   TextEditingController gmail = new TextEditingController();
//   TextEditingController pass = new TextEditingController();
//   GoogleSignIn googlesign = new GoogleSignIn(scopes: ['email']);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextField(
//             controller: gmail,
//           ),
//           TextField(
//             controller: pass,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 final GoogleSignInAccount? mygoogleAccount =
//                     await googlesign.signIn();
//               },
//               child: Text("sign with gmail"))
//         ],
//       ),
//     );
//   }

//   void googleSignin() async {
//     final GoogleSignInAccount? mygoogleAccount = await googlesign.signIn();
//   }
// }
