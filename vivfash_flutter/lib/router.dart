import 'package:flutter/material.dart';
import 'package:vivfash_flutter/features/auth/screens/auth_screen.dart';

Route <dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name) {
    case AuthScreen.routename:
    return MaterialPageRoute(
      settings: routeSettings,
      builder:(_)=>
      const AuthScreen()
    ); 

    default: 
    return MaterialPageRoute(
      settings: routeSettings,
      builder:(_)=>
      const Scaffold(
        body: Center(child:
         Text('Screen does not exist'),),
      )
    ); 
  }
}