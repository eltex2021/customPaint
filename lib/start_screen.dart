import 'package:flutter/material.dart';
import 'package:for_study092021/screen_one.dart';
import 'theme/colors.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        title: Text(
          "Рисуем в Custom paint",
          style: TextStyle(color: Colors.red.shade200),
        ),
      ),
      body: Stack(
        children: [
          Container(
            //height:MediaQuery.of(context).size.height,
            child: TopBar(),
          ),
          Positioned(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenOne(),
                            ));
                      },
                      icon: Icon(Icons.contact_support_outlined)))),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: MediaQuery.of(context).size.height,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    // moveTo
    // Этот метод нужен для перемещения точки отрисовки.
    //cubicTo
    //  Данный метод используется для построения кубической кривой путем указания 2 контрольных и конечной точек.
    //arcToPoint
    // Данный метод нужен для рисования дуги от начальной точки до указанной точки

    //рисуем линию вниз из левого верхнего угла
    path.lineTo(0, size.height * 1);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);

    //кривая безье
    //path.quadraticBezierTo(size.width* 0.10, size.height*0.70,   size.width*0.17, size.height*0.90);
    //path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    //path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    //path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    //path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width*0.5, size.height*0.65 );
    path.close();

    paint.color = colorThree;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);

    // path.quadraticBezierTo(size.width*0.10, size.height*0.80, size.width*0.15, size.height*0.60);
    // path.quadraticBezierTo(size.width*0.20, size.height*0.45, size.width*0.27, size.height*0.60);
    // path.quadraticBezierTo(size.width*0.45, size.height, size.width*0.50, size.height*0.80);
    // path.quadraticBezierTo(size.width*0.55, size.height*0.45, size.width*0.75, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.85, size.height*0.93, size.width, size.height*0.60);
    // path.lineTo(size.width, 0);
    path.close();
    //
    paint.color = colorTwo;
    canvas.drawPath(path, paint);

    path = Path();
    //path.moveTo(150, 150);
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 100));

    // path.lineTo(0, size.height*0.65);
    // path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
    // path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
    // path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.60);
    // path.lineTo(size.width, 0);
    // path.close();

    paint.color = colorOne;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
