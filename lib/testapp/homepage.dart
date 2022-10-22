import 'package:finaltest2/testapp/googlisignin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            final provider= Provider.of<GoogleSigninProvider>(context,listen: false);
            provider.googleLogin();
          }, child: Text("google"))
        ],
      ),
    );
  }
}