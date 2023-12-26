import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return Scaffold(
      backgroundColor: Colors
          .blueGrey[900], // Utilisation d'une couleur prédéfinie de Flutter
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'CONVERSION',
              style: TextStyle(
                color: Colors.white, // Couleur du texte en blanc
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '.',
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte en blanc
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(width: 10.0),
                SpinKitFadingCircle(
                  color: Colors.blue, // Couleur du spinner en bleu
                  size: 50.0,
                ),
              ],
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
