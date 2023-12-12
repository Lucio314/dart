import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:google_fonts/google_fonts.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(22, 25, 37, 1)),
      child: Container(
          child: Stack(
        children: [
          Container(
            height: 380,
            width: 380,
            child: CustomPaint(
              painter: MyCustomPainter(),
            ),
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'CONVERSION',
                // style: GoogleFonts.poppins(
                //     fontSize: 32.0,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromRGBO(255, 254, 244, 1)),
                // strutStyle: StrutStyle(leading: 0),
              ),
              Text(
                ' .',
                // style: GoogleFonts.poppins(
                //     fontSize: 52.0,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromRGBO(252, 210, 60, 1)),
                // strutStyle: StrutStyle(leading: 0),
              ),
              SpinKitFadingCircle(
                color: Color.fromARGB(255, 5, 8, 8),
                size: 80.0,
              )
            ],
          )),
          Positioned(
              bottom: -180,
              right: -180,
              child: Transform.rotate(
                angle: 70 * 3.141592653589793 / 180,
                child: CustomPaint(
                  painter: RectanglePainter(),
                  size: Size(410.0, 410.0),
                ),
              ))
        ],
      )),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromRGBO(204, 202, 90, 1)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 7, size.height / 10);
    final radius = size.width / 3;

    // Dessine un cercle au centre de la zone de dessin
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RectanglePainter extends CustomPainter {
  //  $property;

  // public function __construct($property)
  // {
  //     $this->property = $property;
  // }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromRGBO(93, 144, 253, 1)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    final rect = Rect.fromPoints(Offset(size.width / 4, size.height / 4),
        Offset(3 * size.width / 4, 3 * size.height / 4));

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
