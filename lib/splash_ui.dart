import 'dart:async';

import 'package:calculator/simple_ui.dart';
import 'package:flutter/material.dart';


//this is the splash screen of the app
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return (const simpleCalculator());
      }));
    });
  }


  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor:const Color.fromARGB(255, 0, 0, 0),
      body: Padding(padding:const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //Calculator app icon
            Image.asset('assets/icon.png', width: MediaQuery.of(context).size.width * 0.25),
            const Divider(
              height: 30,
            ),
            //Progress Bar
            SizedBox(                                                           //to provide a width and height to the progress bar
              width: MediaQuery.of(context).size.width * 0.369,                 //to set the width
              child: const LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),),
    );
  }
}

