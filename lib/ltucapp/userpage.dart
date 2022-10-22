import 'package:finaltest2/ltucapp/showStudents.dart';
import 'package:flutter/material.dart';

class userpage extends StatefulWidget {
  const userpage({super.key});

  @override
  State<userpage> createState() => _userpageState();
}

class _userpageState extends State<userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: Text("User Page"),),
      body:Show()
      );
  }
}
