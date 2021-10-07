import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_study092021/animations/anamation_one.dart';
import 'package:for_study092021/screen_one.dart';
import '../theme/colors.dart';
import 'package:image_picker/image_picker.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  File? imageFromGallery;

  Future getImageFromGallery() async {
    try {
      final imageFromGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFromGallery == null) return;

      final imageTemp = File(imageFromGallery.path);

      setState(() {
        this.imageFromGallery = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Ошибка загрузки фото из галереи $e");
    }
  }

  Future getImageFromCamera() async {
    try {
      final imageFromGallery =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (imageFromGallery == null) return;

      final imageTemp = File(imageFromGallery.path);

      setState(() {
        this.imageFromGallery = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Ошибка загрузки фото из камеры $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 50,
      //   backgroundColor: Colors.red.shade100,
      //   title: Text(
      //     "Рисуем в Custom paint",
      //     style: TextStyle(color: Colors.red.shade200),
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            //height:MediaQuery.of(context).size.height,
            child: TopBar(),
          ),
          Positioned(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: Container(
            child: Center(
              // child: IconButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => ScreenOne(),
              //           ));
              //     },
              //     icon: Icon(Icons.photo_camera)),
              child: imageFromGallery != null
                  ? ContainerWithPhoto()
                  : ContainerWithOutPhoto(),
            ),
          )),
          Positioned(
            top: 500,
            right: MediaQuery.of(context).size.width / 2 - 85,
            child: Column(
              children: [
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        //primary: AppColors().colorOne,
                        onPrimary: AppColors().colorBlack),
                    onPressed: () {
                      getImageFromGallery();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.image_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Загрузить фото"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        //primary: AppColors().colorOne,
                        onPrimary: AppColors().colorBlack),
                    onPressed: () {
                      getImageFromCamera();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.photo_camera_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Сделать фото"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_next_outlined,
          color: AppColors().colorBlack,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimationOne(),
                //builder: (context) => ScreenOne(),
              ));
        },
      ),
    );
  }

  Container ContainerWithPhoto() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: FileImage(imageFromGallery!),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Container ContainerWithOutPhoto() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/noimage.png"),
          fit: BoxFit.fill,
        ),
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

    paint.color = AppColors().colorThree;
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
    paint.color = AppColors().colorTwo;
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

    paint.color = AppColors().colorOne;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
