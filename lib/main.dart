import 'package:flutter/material.dart';
import 'package:rickandmorty/router.dart';

void main() {
  runApp(MyApp(approuter: Approuter()));
}

class MyApp extends StatelessWidget {
  final Approuter approuter;
  const MyApp({super.key, required this.approuter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: approuter.generaterouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
