import 'package:flutter/material.dart';
import 'package:promoto/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xFFE7626C),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: TextTheme(
            displayLarge:
                TextStyle(color: Color.fromARGB(255, 230, 77, 61), fontSize: 120, fontWeight: FontWeight.w800),
            displayMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            headlineLarge: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 120, fontWeight: FontWeight.w800),
            headlineMedium: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 30, fontWeight: FontWeight.w500)),
        cardColor: Color.fromARGB(255, 230, 77, 61),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
