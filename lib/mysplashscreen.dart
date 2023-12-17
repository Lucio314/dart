import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:google_fonts/google_fonts.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(22, 25, 37, 1)),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.7,
              width: screenHeight * 0.7,
              child: CustomPaint(
                painter: MyCustomPainter(),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'CONVERSION',
                    // Vos styles de texte ici...
                  ),
                  Text(
                    ' .',
                    // Vos styles de texte ici...
                  ),
                  SpinKitFadingCircle(
                    color: Color.fromARGB(255, 5, 8, 8),
                    size: screenWidth * 0.2,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -screenHeight * 0.3,
              right: -screenWidth * 0.3,
              child: Transform.rotate(
                angle: 70 * 3.141592653589793 / 180,
                child: CustomPaint(
                  painter: RectanglePainter(),
                  size: Size(screenWidth * 0.7, screenHeight * 0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Les peintres personnalisés restent inchangés

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
