import 'dart:io';

import 'package:flutter/material.dart';
import 'package:for_study092021/start_screen.dart';

import 'screen_one.dart';

void main() {

  runApp(MyApp());

  //String line = stdin.readLineSync();


  // Function func = hello;
  // func();
}

void hello(){
  print("Hello!");
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
      //home: ScreenOne(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   var igor = Person("Игорь", 35);
//   //int c = a ~/ b;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               pushok.name2,
//             ),
//             Text(
//               Alan().metod(igor),
//             )
//
//             // Text(
//             //   '$_counter',
//             //   style: Theme.of(context).textTheme.headline4,
//             // ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//
//          //hello();
//           print(pushok.name2);
//           print(Cat.age);
//           print(Alan().age);
//           print(Alan()._name);
//
//           Alan().metod(igor);
//           Petr().toEat();
//         },
//         //onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class Person {
//   final String _name;
//   int age;
//
//   Person(this._name, this.age);
//
//   String metod(Person person) {
//     return "Привет, ${person._name}! Меня зовут $_name";
//   }
// }
//
// class Alan implements Person {
//   @override
//   int age = 25;
//
//   @override
//   // TODO: implement _name
//   String get _name => "Алан";
//
//   @override
//   String metod(Person person) {
//     return "Привет, ${person._name}! Меня зовут $_name";
//   }
// }
//
//
// //создаем миксин
// mixin Eating {
//   void eat() {
//     print("Хочет кушать");
//   }
// }
//
// class Petr with Eating implements Person {
//   @override
//   int age = 45;
//
//   @override
//   // TODO: implement _name
//   String get _name => "Петр";
//
//   @override
//   String metod(Person person) {
//     return "Привет, ${person._name}! Меня зовут $_name";
//   }
//
//   void toEat () {
//     eat();
//     print(Petr()._name);
//   }
// }
//
// class Cat {
//   static String name = "барсик";
//   final String name2;
//   static const int age = 5;
//
//   Cat(
//     this.name2,
//   );
// }
//
// Cat pushok = Cat(
//   "своя фамилия",
// );
//
// class Cat2 extends Cat {
//   Cat2(String name2) : super(name2);
//
//   @override
//   // TODO: implement name2
//   String get name2 => "мурзик Новый";
// }
//
// Cat2 murzik = Cat2("мурзик");
