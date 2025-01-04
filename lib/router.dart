import 'package:flutter/material.dart';
import 'package:rickandmorty/constans/strings.dart';
import 'package:rickandmorty/presntion/screens/details_screen.dart';
import 'package:rickandmorty/presntion/screens/home_screen.dart';

class Approuter {
  Route? generaterouter(RouteSettings setting) {
    switch (setting.name) {
      case homescreen:
        return MaterialPageRoute(builder: (_) => Homescreen());
      case detalisscreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
    }
  }
}
