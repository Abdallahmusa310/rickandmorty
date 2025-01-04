import 'package:flutter/material.dart';
import 'package:rickandmorty/presntion/screens/home_screen.dart';

class Approuter {
  Route? generaterouter(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Homescreen());
    }
  }
}
