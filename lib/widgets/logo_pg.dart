import 'dart:async';

import 'package:activv/dashboard.dart';
import 'package:activv/widgets/login_pg.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: Logo(),
  ));
}

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  final userBox = Hive.box('userbox');
  @override
  void initState() {
    super.initState();
    // uncomment the following line to display loginpage.
    userBox.delete('userid');

    Timer(const Duration(seconds: 3), () {
      if (userBox.get("userid") == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const FormPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 153),
        body: Center(
          child: Text(
            "ACTIVV",
            style: TextStyle(
                color: Colors.white,
                fontSize: 76,
                fontFamily: "Barlow-Bold",
                letterSpacing: 6),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
