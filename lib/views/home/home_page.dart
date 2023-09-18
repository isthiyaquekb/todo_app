import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("HOME PAGE",style: TextStyle(
          color: Colors.red,fontSize: 23,fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}
