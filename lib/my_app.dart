import 'package:flutter/material.dart';
import 'package:instashop/marketplace/marketplace.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Instashop',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.pink,
      ),
      home: Marketplace(),
    );
  }
}