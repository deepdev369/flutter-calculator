import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
  final String historyString;
  const history({super.key, required this.historyString});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(
          title:const Text("History"),
          centerTitle: true,
          backgroundColor:const Color.fromARGB(255, 10, 10, 10),
        ),
        body: ListView(children: [
          Text(historyString, 
          textAlign: TextAlign.right,
          style:const TextStyle(
            color: Colors.white,
            fontSize: 20
          ),)
        ],
        ),
      ),
    );
  }
}