import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmorty/router.dart';

void main() {
  runApp(MyApp(approuter: Approuter()));
}

class MyApp extends StatelessWidget {
  final Approuter approuter;
  const MyApp({super.key, required this.approuter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: approuter.generaterouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
