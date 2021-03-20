import 'package:flutter/material.dart';
import 'package:instashop/flavour.dart';
import 'package:instashop/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider<flavour>.value(value: flavour.production,
  child: MyApp()));
}


