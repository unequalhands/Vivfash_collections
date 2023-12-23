import 'package:flutter/material.dart';
import 'package:vivfash_flutter/constants/global_variables.dart';
import 'package:vivfash_flutter/features/auth/screens/auth_screen.dart';
import 'package:vivfash_flutter/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vIVFASH COLLECTIONS',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary:GlobalVariables.secondaryColor, ),
        appBarTheme: const AppBarTheme(elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)),
       
      ),
      onGenerateRoute: (settings)=>generateRoute(settings),
      home: const AuthScreen()
    );
  }
}


