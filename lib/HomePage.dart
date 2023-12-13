import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.height;
    // double halfScreenWidth = (screenWidth / 8);
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 243, 235, 1)),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: halfScreenWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/temperature_converter');
                                },
                                child: Container(
                                    height: 150,
                                    width: 145,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(250, 223, 206, 1),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: SvgPicture.asset(
                                            'assets/svg/temp.svg',
                                            width: 60,
                                            height: 60,
                                          ),
                                        )
                                      ],
                                    ))),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/mass_converter');
                                },
                                child: Container(
                                    height: 150,
                                    width: 145,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(250, 223, 206, 1),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: SvgPicture.asset(
                                            'assets/svg/weight.svg',
                                            width: 60,
                                            height: 60,
                                          ),
                                        )
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/currency_converter');
                                },
                                child: Container(
                                    height: 150,
                                    width: 145,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(250, 223, 206, 1),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: SvgPicture.asset(
                                            'assets/svg/devise.svg',
                                            width: 60,
                                            height: 60,
                                          ),
                                        )
                                      ],
                                    ))),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/distance_converter');
                                },
                                child: Container(
                                    height: 150,
                                    width: 145,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(250, 223, 206, 1),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: SvgPicture.asset(
                                            'assets/svg/highway.svg',
                                            width: 60,
                                            height: 60,
                                          ),
                                        )
                                      ],
                                    ))),
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
      ),
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
