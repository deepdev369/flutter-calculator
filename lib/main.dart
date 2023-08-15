import 'package:calculator/splash_ui.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        
      ),
      home:const SplashScreen(),
      
      
    );
  }
}