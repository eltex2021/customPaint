import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

//bool ? isSorted;
bool isSorted = false;
List<int> massiv2 = [];
var massiv3 = [30, 20, 6, 7, 8, 9, 10, 40, 60, 50, 1, 2, 3, 4, 5];

getSorting() {
  List<int> sortMassiv = [];
  sortMassiv.addAll(massiv3);
  int tmp;

  for (int j = 0; j < sortMassiv.length - 1; j++) {
    for (int i = 0; i < sortMassiv.length - 1; i++)
      if (sortMassiv[i] > sortMassiv[i + 1]) {
        tmp = sortMassiv[i];
        sortMassiv[i] = sortMassiv[i + 1];
        sortMassiv[i + 1] = tmp;
      }
  }
  //isSorted = true;
  print(isSorted);
  return sortMassiv;
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Пузырьковая сортировка")),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(child: Text("Список целых чисел для сортировки")),
            const SizedBox(
              height: 10,
            ),
            Text(massiv3.toString()),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                getSorting();

                isSorted = true;
                print(isSorted);
                setState(() {});
              },
              child: Text(
                "Отсортировать",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey)),
            ),
            Center(child: Text("Список после сортировки")),
            const SizedBox(
              height: 10,
            ),
            isSorted
                ? Center(child: Text("Ответ: " + getSorting().toString()))
                : Text("Нажми на кнопку ))"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}


// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => Task2_2(),
// ));