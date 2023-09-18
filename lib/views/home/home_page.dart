import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("TASK LIST",style: TextStyle(
            color: Colors.red,fontSize: 23,fontWeight: FontWeight.w700
          ),),
          Text("Work",style: TextStyle(
              color: Colors.red,fontSize: 23,fontWeight: FontWeight.w700
          ),),
        ],
      ),
    );
  }
}
