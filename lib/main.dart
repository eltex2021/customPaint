import 'package:flutter/material.dart';
import 'package:for_study092021/start_screen/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Camera(),
      home: StartScreen(),
    );
  }
}
