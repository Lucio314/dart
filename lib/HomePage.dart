import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dessinez ce que vous voulez ici en utilisant les méthodes de Canvas
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    // Un exemple de dessin : un cercle au centre
    canvas.drawCircle(Offset(0, 0), 100.0, paint);
    canvas.drawCircle(Offset(400, 400), 100.0, paint);
    canvas.drawCircle(Offset(0, 600), 100.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Retourne true si le dessin doit être mis à jour lors d'un rebuild
    return false; // Mettez à true si le dessin change en fonction de données externes
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
              child: Column(
                children: [
                  CustomPaint(
                    painter:
                        MyPainter(), // Utilisation de votre CustomPainter ici
                    size: Size(350, 00), // Taille de votre dessin
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/mass_converter');
                    },
                    child: Card(
                      color: Colors.white, // Arrière-plan blanc pour la carte
                      child: Column(
                        children: [
                          Text(
                            'Convertisseur de masse', // Texte au-dessus de la carte
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'assets/masse.png',
                            height: 250, // Taille de votre image
                            width: 500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/distance_converter');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            'Convertisseur de distance',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'assets/Distance.png',
                            height: 250,
                            width: 500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/currency_converter');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            'Convertisseur de devise',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'assets/devises.png',
                            height: 250,
                            width: 500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/temperature_converter');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            'Convertisseur de température',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'assets/temperature.png',
                            height: 250,
                            width: 500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter:
                        MyPainter(), // Utilisation de votre CustomPainter ici
                    size: Size(500, 500), // Taille de votre dessin
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
