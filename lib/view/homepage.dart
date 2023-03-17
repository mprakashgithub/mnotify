import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MaterialButton(
        color: Colors.red,
        onPressed: () {},
        child: Text("logout"),
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
